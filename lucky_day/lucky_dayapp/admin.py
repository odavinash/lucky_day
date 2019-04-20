from django.contrib import admin
from django.contrib.auth import get_user_model
from lucky_dayapp import models


@admin.register(get_user_model())
class UserAdmin(admin.ModelAdmin):
    list_display = ('first_name', 'last_name', 'is_active', 'is_staff',)
    search_fields = ('first_name',)


@admin.register(models.Offer)
class OfferAdmin(admin.ModelAdmin):
    list_display = ('offer_media', 'top_up_coin', 'cash',)
    search_fields = ('top_up_coin', 'cash')


@admin.register(models.Profile)
class ProfileAdmin(admin.ModelAdmin):
    list_display = ('profile_media', 'user_id', 'coin', 'cash',)
    search_fields = ('coin', 'cash')


@admin.register(models.ScratchCard)
class ScratchCardAdmin(admin.ModelAdmin):
    list_display = ('user_id', 'offer_id',)
    search_fields = ('user_id', 'offer_id')


@admin.register(models.Order)
class OrderAdmin(admin.ModelAdmin):
    list_display = ('user_id', 'datetime', 'order_no')
    search_fields = ('datetime', 'order_no')


@admin.register(models.WireTransfer)
class WireTransferAdmin(admin.ModelAdmin):
    list_display = ('user_id', 'acc_no')
    search_fields = ('acc_no',)