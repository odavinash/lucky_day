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
            print(serializer)
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


class ScratchCard(generics.CreateAPIView):
    serializer_class = serializers.ScratchCardSerializer
    permission_classes = (IsAuthenticated,)
    model = models.ScratchCard

    def create(self, request, *args, **kwargs):
        try:
            serializer = self.get_serializer(data=request.data)
            serializer.is_valid(raise_exception=True)
            self.perform_create(serializer)
            return Response ({"status": 200, "message" : 'Scratch Card successfully.'}, status=status.HTTP_201_CREATED)
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
                user_rank = models.LeaderBoard.objects.values('rank_no', 'user_id__first_name', 'user_id__last_name', 'user_id__profile__profile_media').get(user_id=self.request.user)
            except Exception as e:
                user_rank = ""
                print(e)
            return Response({'user_rank': user_rank, 'data': serializer.data})
        except Exception as e:
            print(e)
            return Response ({"status": 400, "message" : "Fail to get leaderboard"}, status=status.HTTP_400_BAD_REQUEST)