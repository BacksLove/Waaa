enum TripsSteps {
  travelStep,
  photoStep,
  activityStep,
  locomotionStep,
  homeSteps,
  participationStep,
  resumeStep,
}

enum TravelSteps {
  infos,
  date,
  trip,
}

enum TripsError {
  none,
  tripNameEmpty,
  destinationsEmpty,
}

enum StepDateStatus {
  previous,
  actual,
  future,
  bucketList,
}

enum TripDetailStatus {
  none,
  loading,
  loaded,
  error,
}

enum TripMenuItem {
  modify,
  delete,
  publish,
}

enum TripTabShowed {
  trip,
  photo,
  partner,
  event,
}
