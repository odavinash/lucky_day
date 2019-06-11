from django.urls import path
from lucky_dayapp import views
from django.contrib.staticfiles.urls import staticfiles_urlpatterns


app_name = 'lucky_dayapp'

urlpatterns = [
	path('signup', views.SignUp.as_view(), name='signup'),
	path('login', views.Login.as_view(), name='login'),
	path('login/social', views.LoginSocial.as_view(), name='login-social'),
	path('get-scratch-offer/<int:page>', views.GetOffer.as_view(), name='get-scratch-offer'),
	path('update-profile', views.UpdateProfile.as_view(), name='update-profile'),
	path('update-profile-master', views.UpdateProfileMaster.as_view(), name='update-profile-master'),
	path('get-profile', views.GetProfile.as_view(), name='get-profile'),
	path('scratch-card', views.ScratchCard.as_view(), name='scratch-card'),
	path('order', views.Order.as_view(), name='order'),
	path('wire-transfer', views.WireTransfer.as_view(), name='wire-transfer'),
	path('paypal', views.Paypal.as_view(), name='paypal'),
	path('get-leaderboard/<int:page>', views.GetLeaderboard.as_view(), name='get-leaderboard'),
	path('get-redeem-offer/<int:page>', views.GetRedeemOffer.as_view(), name='get-redeem-offer'),
	path('avail-redeem-offer/<int:redeem_offer_id>', views.AvailRedeemOffer.as_view(), name='avail-redeem-offer'),
]


