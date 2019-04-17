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
