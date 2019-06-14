from django.contrib.auth import authenticate
from rest_framework import serializers
from lucky_dayapp.mixins import UserSerializer
from . import models
from django.contrib.auth import get_user_model
from django.contrib.auth.password_validation import validate_password
from rest_framework.exceptions import AuthenticationFailed, ValidationError
from lucky_day.utils import create_profile


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

        create_profile(user)

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

        self.user = user
        
        return data


class LoginSocialSerializer(UserSerializer, serializers.ModelSerializer):

    first_name = serializers.CharField()
    last_name = serializers.CharField()
    email = serializers.CharField()
    provider_id = serializers.CharField()

    class Meta:
        model = get_user_model()
        read_only_fields = ('is_staff', 'is_active', 'last_login', 'groups', 'user_permissions', 'is_superuser',
                            'last_update_userid', 'last_update_date')
        exclude = ('password',)

    def create(self, validated_data):
        user, _ = get_user_model().objects.update_or_create(
            email=self.validated_data.get('email'),
            defaults={
                'first_name': self.validated_data.get('first_name'),
                'last_name': self.validated_data.get('last_name'),
                'email': self.validated_data.get('email'),
                'provider_id': self.validated_data.get('provider_id'),
                'is_active': True
            }
        )
        self.user = user

        create_profile(user)

        return user


class OfferSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Offer
        fields = ('__all__')


class RedeemOfferSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.RedeemOffer
        fields = ('__all__')


class ProfileSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Profile
        fields = ('__all__')


class ProfileMasterSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.User
        fields = ('first_name', 'last_name',)


class ScratchCardSerializer(serializers.ModelSerializer):

    offer_id = serializers.IntegerField()

    class Meta:
        model = models.ScratchCard
        fields = ('offer_id',)

    def create(self, validated_data):
        validated_data['user_id'] = self.context['request'].user
        offer = models.Offer.objects.get(offer_id=validated_data['offer_id'])
        
        profile = models.Profile.objects.get(user_id=self.context['request'].user)
        
        if offer.top_up_coin is not None:
            profile.coin += offer.top_up_coin
        
        if offer.cash is not None:
            profile.cash += offer.cash

        profile.save()

        validated_data['offer_id'] = offer

        return super(ScratchCardSerializer, self).create(validated_data)


class OrderSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Order
        fields = ('order_id',)

    def create(self, validated_data):
        validated_data['user_id'] = self.context['request'].user

        return super(OrderSerializer, self).create(validated_data)


class WireTransferSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.WireTransfer
        exclude = ('user_id',)

    def create(self, validated_data):
        validated_data['user_id'] = self.context['request'].user

        return super(WireTransferSerializer, self).create(validated_data)


class PaypalferSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Paypal
        exclude = ('user_id',)

    def create(self, validated_data):
        validated_data['user_id'] = self.context['request'].user

        return super(PaypalferSerializer, self).create(validated_data)


class LeaderBoardSerializer(serializers.ModelSerializer):

    first_name = serializers.CharField(source='user_id.first_name')
    last_name = serializers.CharField(source='user_id.last_name')
    coin = serializers.CharField(source='user_id.profile.first.coin')

    class Meta:
        model = models.LeaderBoard
        fields = ('__all__')


class AvailRedeemOfferSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Profile
        fields = ('coin',)