from lucky_dayapp.models import Profile, LeaderBoard


def create_leaderboard():
	print('Start cron.....')
	try:
		profile = Profile.objects.all().order_by('-coin')
		cnt = 0
		for obj in profile:
			print(obj)
			cnt += 1
			LeaderBoard.objects.create(rank_no = cnt, user_id = obj.user_id)
	except Exception as e:
		print(e)