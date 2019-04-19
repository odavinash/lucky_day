from django.contrib.auth import authenticate
from rest_framework import serializers
from lucky_dayapp.mixins import UserSerializer
from . import models
from django.contrib.auth import get_user_model
from django.contrib.auth.password_validation import validate_password
from rest_framework.exceptions import AuthenticationFailed, ValidationError


class SignUpSerializer(UserSerializer, serializers.ModelSerializer):
    
    class Meta:
        model = get_user_model()
        fields = (
            'password',
            'first_name',
            'last_name',
            'email',
            )

        read_only_fields = ('is_staff', 'is_active', 'last_login', 'groups', 'user_permissions', 'is_superuser',
                            'last_update_userid', 'last_update_date')
        extra_kwargs = {
            'password': {'write_only': True},
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    @staticmethod
    def validate_password(password):
        if validate_password(password) is None:
            return password

    @staticmethod
    def validate_email(email):
        try:
            get_user_model().objects.get(email=email)
            raise ValidationError('A user already exists with this email')
        except get_user_model().DoesNotExist:
            pass

        return email

    def create(self, validated_data):
        user = get_user_model().objects.create_user(**validated_data)
        
        self.user = user
        
        return user


class LoginSerializer(UserSerializer, serializers.Serializer):
    email = serializers.CharField()
    password = serializers.CharField()

    class Meta:
        fields = (
            'email',
            'password'
            )

    def validate(self, data):
        user = authenticate(
            self.context['request'],
            email=data.get('email'),
            password=data.get('password'),
        )
        
        if not user:
        	print(user)
        else:
        	print(user)

        self.user = user

        return data


class LoginSocialSerializer(UserSerializer, serializers.Serializer):
    first_name = serializers.CharField()
    last_name = serializers.CharField()
    email = serializers.CharField()
    password = serializers.CharField()
    provider_id = serializers.CharField()

    class Meta:
        fields = (
            'first_name',
            'last_name',
            'email',
            'password'
            'provider_id',
            )

        extra_kwargs = {
            'password': {'write_only': True},
        }

    @staticmethod
    def validate_password(password):
        if validate_password(password) is None:
            return password

    def validate(self, data):
        print(data.get('email'))
        print(data.get('password'))
        user = authenticate(
            self.context['request'],
            email=data.get('email'),
            password=data.get('password'),
        )
        
        if not user:
            pass
        else:
            pass

        self.user = user

        print('data start...')
        print(self.user)
        print('data end.....')
        return data
