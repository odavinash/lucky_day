from lucky_dayapp.models import Profile, LeaderBoard


def create_profile(user):
	Profile.objects.get_or_create(user_id = user)
	LeaderBoard.objects.get_or_create(user_id = user, rank_no=0)
