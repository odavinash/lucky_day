from lucky_dayapp.models import Profile


def create_profile(user):
	Profile.objects.create(user_id= user)