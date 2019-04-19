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


class LoginSocial(generics.GenericAPIView):
    serializer_class = serializers.LoginSocialSerializer

    def post(self, request):
        try:
            # print(request.data)
            # # first_name = request.data.pop('first_name')
            # # last_name = request.data.pop('last_name')
            # # provider_id = request.data.pop('provider_id')
            # print(request.data)
            serializer = self.get_serializer(data=request.data)
            try:
                user_obj = get_user_model().objects.get(Q(provider_id=request.data.get('provider_id')) | Q(email=request.data.get('email')))
                print(user_obj)
            except get_user_model().DoesNotExist:
                print('eeeeeeeeeeeeeeeeeeeeeeeeeeee')
                get_user_model().objects.create(email=request.data.get('email'),
                                                            first_name='aaa',
                                                            last_name='bb',
                                                            provider_id='ak',
                                                            password=request.data.get('password'),
                                                            )
                print('created')
            serializer.is_valid(raise_exception=True)
           
            data = serializer.get_data()
            print('end.....')
            
            return Response({"status": 200, 'message': 'success', 'success': True, 'data': data})
        except Exception as e:
            print(e)
            return Response ({"status": 400, "message" : "Authentication fail"}, status=status.HTTP_400_BAD_REQUEST)
