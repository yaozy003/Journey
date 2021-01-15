import 'package:journey/models/user_entity.dart';

userEntityFromJson(UserEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['first_name'] != null) {
		data.firstName = json['first_name'];
	}
	if (json['last_name'] != null) {
		data.lastName = json['last_name'];
	}
	if (json['dob'] != null) {
		data.dob = json['dob'].toString();
	}
	if (json['gender'] != null) {
		data.gender = json['gender'];
	}
	if (json['workout_frequency'] != null) {
		data.workoutFrequency = json['workout_frequency'];
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar'].toString();
	}
	if (json['workouts_count'] != null) {
		data.workoutsCount = json['workouts_count'] is String
				? int.tryParse(json['workouts_count'])
				: json['workouts_count'].toInt();
	}
	if (json['reps_count'] != null) {
		data.repsCount = json['reps_count'] is String
				? int.tryParse(json['reps_count'])
				: json['reps_count'].toInt();
	}
	if (json['cover'] != null) {
		data.cover = json['cover'].toString();
	}
	if (json['access_token'] != null) {
		data.accessToken = json['access_token'].toString();
	}
	if (json['email'] != null) {
		data.email = json['email'].toString();
	}
	if (json['status'] != null) {
		data.status = json['status'].toString();
	}
	if (json['subscription_status'] != null) {
		data.subscriptionStatus = json['subscription_status'].toString();
	}
	if (json['record_begin_day'] != null) {
		data.recordBeginDay = json['record_begin_day'].toString();
	}
	if (json['record_end_day'] != null) {
		data.recordEndDay = json['record_end_day'].toString();
	}
	if (json['auto_record'] != null) {
		data.autoRecord = json['auto_record'];
	}
	if (json['trainer_preference'] != null) {
		data.trainerPreference = json['trainer_preference'].toString();
	}
	if (json['voice_preference'] != null) {
		data.voicePreference = json['voice_preference'].toString();
	}
	if (json['show_setting_tutorial'] != null) {
		data.showSettingTutorial = json['show_setting_tutorial'];
	}
	if (json['show_exercise_tutorial'] != null) {
		data.showExerciseTutorial = json['show_exercise_tutorial'];
	}
	if (json['get_started'] != null) {
		data.getStarted = json['get_started'];
	}
	if (json['referral_code'] != null) {
		data.referralCode = json['referral_code'].toString();
	}
	if (json['get_to_know_you'] != null) {
		data.getToKnowYou = json['get_to_know_you'];
	}
	if (json['user_type'] != null) {
		data.userType = json['user_type'].toString();
	}
	if (json['payment_type'] != null) {
		data.paymentType = json['payment_type'];
	}
	if (json['trial_bonus_reward'] != null) {
		data.trialBonusReward = json['trial_bonus_reward'];
	}
	if (json['trial_expiration_time'] != null) {
		data.trialExpirationTime = json['trial_expiration_time'] is String
				? int.tryParse(json['trial_expiration_time'])
				: json['trial_expiration_time'].toInt();
	}
	if (json['avatar_attached'] != null) {
		data.avatarAttached = json['avatar_attached'];
	}
	return data;
}

Map<String, dynamic> userEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['first_name'] = entity.firstName;
	data['last_name'] = entity.lastName;
	data['dob'] = entity.dob;
	data['gender'] = entity.gender;
	data['workout_frequency'] = entity.workoutFrequency;
	data['avatar'] = entity.avatar;
	data['workouts_count'] = entity.workoutsCount;
	data['reps_count'] = entity.repsCount;
	data['cover'] = entity.cover;
	data['access_token'] = entity.accessToken;
	data['email'] = entity.email;
	data['status'] = entity.status;
	data['subscription_status'] = entity.subscriptionStatus;
	data['record_begin_day'] = entity.recordBeginDay;
	data['record_end_day'] = entity.recordEndDay;
	data['auto_record'] = entity.autoRecord;
	data['trainer_preference'] = entity.trainerPreference;
	data['voice_preference'] = entity.voicePreference;
	data['show_setting_tutorial'] = entity.showSettingTutorial;
	data['show_exercise_tutorial'] = entity.showExerciseTutorial;
	data['get_started'] = entity.getStarted;
	data['referral_code'] = entity.referralCode;
	data['get_to_know_you'] = entity.getToKnowYou;
	data['user_type'] = entity.userType;
	data['payment_type'] = entity.paymentType;
	data['trial_bonus_reward'] = entity.trialBonusReward;
	data['trial_expiration_time'] = entity.trialExpirationTime;
	data['avatar_attached'] = entity.avatarAttached;
	return data;
}