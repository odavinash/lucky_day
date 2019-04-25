from lucky_dayapp.models import Profile, LeaderBoard


def create_profile(user):
	Profile.objects.create(user_id = user, coin = 0, cash = 0)
	LeaderBoard.objects.create(user_id = user, rank_no=0)
