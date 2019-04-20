from django.urls import path
from lucky_dayapp import views
from django.contrib.staticfiles.urls import staticfiles_urlpatterns


app_name = 'lucky_dayapp'

urlpatterns = [
	path('signup', views.SignUp.as_view(), name='signup'),
	path('login', views.Login.as_view(), name='login'),
	path('login/social', views.LoginSocial.as_view(), name='login-social'),
	path('get-offer/<int:page>', views.GetOffer.as_view(), name='get-offer'),
	path('update-profile', views.UpdateProfile.as_view(), name='update-profile'),
	path('scratch-card', views.ScratchCard.as_view(), name='scratch-card'),
]


