from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from django.contrib.auth import authenticate
from rest_framework import generics
from lucky_dayapp import serializers
from lucky_dayapp import models
from rest_framework import status
from django.template import loader 
from django.http import HttpResponse
from django.contrib.auth import get_user_model
from django.db.models import Q
from collections import OrderedDict


# Create your views here.


class SignUp(generics.CreateAPIView):
    serializer_class = serializers.SignUpSerializer
    model = get_user_model()

    def create(self, request, *args, **kwargs):
        try:
            serializer = self.get_serializer(data=request.data)
            serializer.is_valid(raise_exception=True)
            self.perform_create(serializer)
            data = serializer.get_data()
            return Response({"status": 200, 'message': 'success', 'success': True, 'data': data})
        except Exception as e:
            return Response({'message': format(e.args[-1]), 'success': False})


class Login(generics.GenericAPIView):
    serializer_class = serializers.LoginSerializer

    def post(self, request):
        try:
            serializer = self.get_serializer(data=request.data)
            serializer.is_valid(raise_exception=True)
            data = serializer.get_data()
            return Response({"status": 200, 'message': 'success', 'success': True, 'data': data})
        except Exception as e:
            return Response ({"status": 400, "message" : "Authentication fail"}, status=status.HTTP_400_BAD_REQUEST)


class LoginSocial(generics.CreateAPIView):
    serializer_class = serializers.LoginSocialSerializer
    model = get_user_model()

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        return Response(serializer.get_data())


class GetOffer(generics.ListAPIView):
    serializer_class = serializers.OfferSerializer
    permission_classes = (IsAuthenticated,)
    model = models.Offer

    def get_queryset(self):
        try:
            page = self.kwargs['page']
            start = ((page - 1)*10)
            end = start + 10
            return self.model.objects.filter(~Q(offer_id__in=models.ScratchCard.objects.values('offer_id').filter(user_id=self.request.user))).order_by('-offer_id')[start:end]
        except self.model.DoesNotExist:
            return None

    def list(self, request, *args, **kwargs):
        try:
            serializer = self.get_serializer(self.get_queryset(), many=True)
            return Response({'data': serializer.data})
        except Exception as e:
            print(e)
            return Response ({"status": 400, "message" : "Fail to get offer"}, status=status.HTTP_400_BAD_REQUEST)


class GetRedeemOffer(generics.ListAPIView):
    serializer_class = serializers.RedeemOfferSerializer
    permission_classes = (IsAuthenticated,)
    model = models.RedeemOffer

    def get_queryset(self):
        try:
            page = self.kwargs['page']
            start = ((page - 1)*10)
            end = start + 10
            return self.model.objects.all().order_by('-redeem_offer_id')[start:end]
        except self.model.DoesNotExist:
            return None

    def list(self, request, *args, **kwargs):
        try:
            serializer = self.get_serializer(self.get_queryset(), many=True)
            return Response({'data': serializer.data})
        except Exception as e:
            print(e)
            return Response ({"status": 400, "message" : "Fail to get offer"}, status=status.HTTP_400_BAD_REQUEST)


class UpdateProfile(generics.UpdateAPIView):
    serializer_class = serializers.ProfileSerializer
    permission_classes = (IsAuthenticated,)
    model = models.Profile
    http_method_names = ['patch']

    def get_object(self):
        instance, _ = self.model.objects.get_or_create(user_id=self.request.user)
        return instance

    def update(self, request, *args, **kwargs):
        try:
            response = super(UpdateProfile, self).update(request, *args, **kwargs)
            return Response({'success': True, 'data':response.data})
        except Exception as e:
            return Response({'message': format(e.args[-1]), 'success': False})


class UpdateProfileMaster(generics.UpdateAPIView):
    serializer_class = serializers.ProfileMasterSerializer
    permission_classes = (IsAuthenticated,)
    model = models.User
    http_method_names = ['patch']

    def get_object(self):
        instance, _ = self.model.objects.get_or_create(id=self.request.user.id)
        return instance

    def update(self, request, *args, **kwargs):
        try:
            response = super(UpdateProfileMaster, self).update(request, *args, **kwargs)
            return Response({'success': True, 'data':response.data})
        except Exception as e:
            return Response({'message': format(e.args[-1]), 'success': False})


class GetProfile(generics.RetrieveAPIView):
    serializer_class = serializers.ProfileSerializer
    permission_classes = (IsAuthenticated,)
    model = models.Profile
    queryset = models.Profile.objects.all()

    def get_object(self):
        try:
            return self.model.objects.get(user_id=self.request.user)
        except self.model.DoesNotExist:
            return None

    def retrieve(self, request, *args, **kwargs):
        try:
            serializer = super(GetProfile, self).retrieve(request, args, kwargs)
            return Response({"status": 200, 'data': serializer.data})
        except Exception as e:
            return Response ({"status": 400, "message" : "Fail to fetch profile"}, status=status.HTTP_400_BAD_REQUEST)


class ScratchCard(generics.CreateAPIView):
    serializer_class = serializers.ScratchCardSerializer
    permission_classes = (IsAuthenticated,)
    model = models.ScratchCard

    def create(self, request, *args, **kwargs):
        try:
            serializer = self.get_serializer(data=request.data)
            serializer.is_valid(raise_exception=True)
            self.perform_create(serializer)

            offer = models.Offer.objects.get(offer_id=request.data['offer_id'])
            if offer.top_up_coin is not None:
                return Response ({"status": 200, 'coin': offer.top_up_coin, "message" : 'Scratch Card successfully.'}, status=status.HTTP_201_CREATED)
        
            if offer.cash is not None:
                return Response ({"status": 200, 'cash': offer.cash, "message" : 'Scratch Card successfully.'}, status=status.HTTP_201_CREATED)
        except Exception as e:
            print(e)
            return Response ({"status": 400, "message" : "Fail to scratch card"}, status=status.HTTP_400_BAD_REQUEST)


class Order(generics.CreateAPIView):
    serializer_class = serializers.OrderSerializer
    permission_classes = (IsAuthenticated,)
    model = models.Order

    def create(self, request, *args, **kwargs):
        try:
            serializer = self.get_serializer(data=request.data)
            serializer.is_valid(raise_exception=True)
            self.perform_create(serializer)
            return Response ({"status": 200, "message" : 'Order successfully.'}, status=status.HTTP_201_CREATED)
        except Exception as e:
            print(e)
            return Response ({"status": 400, "message" : "Fail to Order"}, status=status.HTTP_400_BAD_REQUEST)


class WireTransfer(generics.CreateAPIView):
    serializer_class = serializers.WireTransferSerializer
    permission_classes = (IsAuthenticated,)
    model = models.WireTransfer

    def create(self, request, *args, **kwargs):
        try:
            serializer = self.get_serializer(data=request.data)
            serializer.is_valid(raise_exception=True)
            self.perform_create(serializer)
            return Response ({"status": 200, "message" : 'Wire transfer successfully.'}, status=status.HTTP_201_CREATED)
        except Exception as e:
            print(e)
            return Response ({"status": 400, "message" : "Fail to Wire transfer"}, status=status.HTTP_400_BAD_REQUEST)


class Paypal(generics.CreateAPIView):
    serializer_class = serializers.PaypalferSerializer
    permission_classes = (IsAuthenticated,)
    model = models.Paypal

    def create(self, request, *args, **kwargs):
        try:
            serializer = self.get_serializer(data=request.data)
            serializer.is_valid(raise_exception=True)
            self.perform_create(serializer)
            return Response ({"status": 200, "message" : 'paypal add successfully.'}, status=status.HTTP_201_CREATED)
        except Exception as e:
            print(e)
            return Response ({"status": 400, "message" : "Fail to add Paypal"}, status=status.HTTP_400_BAD_REQUEST)


class GetLeaderboard(generics.ListAPIView):
    serializer_class = serializers.LeaderBoardSerializer
    permission_classes = (IsAuthenticated,)
    model = models.LeaderBoard

    def get_queryset(self):
        try:
            page = self.kwargs['page']
            start = ((page - 1)*10)
            end = start + 10

            return self.model.objects.all().order_by('-leaderboard_id')[start:end]
        except self.model.DoesNotExist:
            return None

    def list(self, request, *args, **kwargs):
        try:
            serializer = self.get_serializer(self.get_queryset(), many=True)
            try:
                user_rank = models.LeaderBoard.objects.values('rank_no', 'user_id__first_name', 'user_id__last_name', 'user_id__profile__coin', 'user_id__profile__profile_media').get(user_id=self.request.user)
            except Exception as e:
                user_rank = ""
                print(e)
            return Response({'user_rank': user_rank, 'data': serializer.data})
        except Exception as e:
            print(e)
            return Response ({"status": 400, "message" : "Fail to get leaderboard"}, status=status.HTTP_400_BAD_REQUEST)


class AvailRedeemOffer(generics.UpdateAPIView):
    serializer_class = serializers.AvailRedeemOfferSerializer
    permission_classes = (IsAuthenticated,)
    model = models.Profile
    http_method_names = ['patch']

    def get_object(self):
        instance, _ = self.model.objects.get_or_create(user_id=self.request.user)
        redeem_offer = models.RedeemOffer.objects.get(redeem_offer_id=self.kwargs['redeem_offer_id'])
        instance.coin = instance.coin - redeem_offer.price
        return instance

    def update(self, request, *args, **kwargs):
        try:
            response = super(AvailRedeemOffer, self).update(request, *args, **kwargs)
            return Response({'success': True, 'data':response.data})
        except Exception as e:
            return Response({'message': format(e.args[-1]), 'success': False})
