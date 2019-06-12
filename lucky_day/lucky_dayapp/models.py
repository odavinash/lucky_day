from django.db import models
from django.contrib.auth.models import BaseUserManager
from django.contrib.auth.models import AbstractBaseUser
from django.contrib.auth.models import PermissionsMixin
from django.utils.translation import ugettext_lazy as _
import uuid
import os
from django.contrib.auth import get_user_model
from django.utils import timezone


def get_upload_path_offer(instance, filename):
    return os.path.join('offer', '{}.{}'.format(uuid.uuid4(), filename.split('.')[-1]))

def get_upload_path_redeem_offer(instance, filename):
    return os.path.join('offer', '{}.{}'.format(uuid.uuid4(), filename.split('.')[-1]))

def get_upload_path_profile(instance, filename):
    return os.path.join('profile', '{}.{}'.format(uuid.uuid4(), filename.split('.')[-1]))


class UserManager(BaseUserManager):
    use_in_migrations = True

    def _create_user(self, email, password, **extra_fields):
        """
        Create and save a user with the given email, and password.
        """
        if not email:
            raise ValueError('The given email must be set')
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, email=None, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', False)
        extra_fields.setdefault('is_superuser', False)
        extra_fields.setdefault('is_active', True)
        return self._create_user(email, password, **extra_fields)

    def create_superuser(self, email, password, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('is_active', True)

        if extra_fields.get('is_staff') is not True:
            raise ValueError('Superuser must have is_staff=True.')
        if extra_fields.get('is_superuser') is not True:
            raise ValueError('Superuser must have is_superuser=True.')

        return self._create_user(email, password, **extra_fields)


class User(AbstractBaseUser, PermissionsMixin):
    class Meta:
    	db_table = "user"

    email = models.EmailField(unique=True)
    first_name = models.CharField(_('first name'), max_length=30, blank=True, null=True)
    last_name = models.CharField(_('last name'), max_length=150, blank=True, null=True)
    provider_id = models.CharField(max_length=150, blank=True,)
    is_staff = models.BooleanField(
        _('staff status'),
        default=False,
        help_text=_('Designates whether the user can log into this admin site.'),
    )
    is_active = models.BooleanField(
        _('active'),
        default=False,
        help_text=_('Designates whether this user should be treated as active. '),
    )

    USERNAME_FIELD = 'email'
    objects = UserManager()

    def __str__(self):
        return f'{self.first_name}'


class Offer(models.Model):
    class Meta:
        db_table = "offer"

    offer_id = models.AutoField(primary_key=True)
    offer_media = models.FileField(upload_to=get_upload_path_offer, blank=True, null=False)
    top_up_coin = models.IntegerField(null=True, blank=True)
    cash = models.IntegerField(null=True, blank=True)


class Profile(models.Model):
    class Meta:
        db_table = "profile"

    profile_id = models.AutoField(primary_key=True)
    user_id = models.ForeignKey(User, on_delete=models.CASCADE, db_column='user_id', related_name='profile')
    profile_media = models.FileField(upload_to=get_upload_path_profile, blank=True, null=False)
    coin = models.IntegerField(null=True, blank=True)
    cash = models.IntegerField(null=True, blank=True)


class ScratchCard(models.Model):
    class Meta:
        db_table = "scratch_card"

    scratch_card_id = models.AutoField(primary_key=True)
    user_id = models.ForeignKey(User, on_delete=models.CASCADE, db_column='user_id')
    offer_id = models.ForeignKey(Offer, on_delete=models.CASCADE, db_column='offer_id')
   

class Order(models.Model):
    class Meta:
        db_table = "order"

    order_id = models.AutoField(primary_key=True)
    user_id = models.ForeignKey(User, on_delete=models.CASCADE, db_column='user_id')
    datetime = models.DateTimeField('datetime', null=False, default=timezone.now)
    

class WireTransfer(models.Model):
    class Meta:
        db_table = "wire_transfer"

    wire_transfer_id = models.AutoField(primary_key=True)
    user_id = models.ForeignKey(User, on_delete=models.CASCADE, db_column='user_id')
    acc_no = models.CharField(unique=False, null=False, max_length=18)
    ifsc = models.CharField(unique=False, null=True, max_length=18)
    swift = models.CharField(unique=False, null=True, max_length=18)
    amount = models.DecimalField(blank=True,  null=True, max_digits=10, decimal_places=2)


class Paypal(models.Model):
    class Meta:
        db_table = "paypal"

    paypal_primary_keys = models.AutoField(primary_key=True)
    user_id = models.ForeignKey(User, on_delete=models.CASCADE, db_column='user_id')
    paypal_id = models.CharField(null=False, blank=False, max_length=200)
    amount = models.DecimalField(blank=True,  null=True, max_digits=10, decimal_places=2)


class LeaderBoard(models.Model):
    class Meta:
        db_table = "leaderboard"

    leaderboard_id = models.AutoField(primary_key=True)
    user_id = models.ForeignKey(User, related_name='leaderboard', on_delete=models.CASCADE, db_column='user_id')
    rank_no = models.IntegerField(unique=False, null=False)
    date = models.DateField('date', null=False, default=timezone.now)


class App_Settings(models.Model):
    class Meta:
        db_table = "app_settings"

    app_settings_id = models.AutoField(primary_key=True)
    top_up_coin = models.IntegerField(null=True, blank=True, default=0)


class RedeemOffer(models.Model):
    class Meta:
        db_table = "redeem_offer"

    redeem_offer_id = models.AutoField(primary_key=True)
    redeem_offer_media = models.FileField(upload_to=get_upload_path_redeem_offer, blank=True, null=False)
    title = models.CharField(null=False, blank=False, max_length=500)
    price = models.IntegerField(null=True, blank=True)
    feature = models.CharField(null=False, blank=False, max_length=5000)
    description = models.CharField(null=False, blank=False, max_length=10000)
    active = models.BooleanField(default=True)
