const getTripByIdQuery = ''' query MyQuery3(\$id: ID!) {
  getTrip(id: \$id) {
    about
    audience
    begin
    createdAt
    duration
    end
    id
    openToJoin
    photo
    reason
    status
    state
    title
    visibility
    userTripsId
    updatedAt
    steps {
      items {
        id
        accommodation {
          id
          name
        }
        city
        id
        country
        begin
        end
        nbDays
        photos
        status
        activities {
          items {
            id
            activity {
              id
              activity
            }
          }
        }
      }
    }
  }
} ''';
