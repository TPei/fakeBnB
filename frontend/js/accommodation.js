class Accommodation {
  constructor(accommodation) {
    console.log(accommodation);
    this.id = accommodation.id;
    this.title = accommodation.title;
    this.type = accommodation.type.name;
    this.city = accommodation.city;
    this.max_guests = accommodation.max_guests;
  }

  setData(accommodation) {
    this.country = accommodation.country;
    this.floor_area = accommodation.floor_area;
    this.bedrooms = accommodation.bedrooms;
    this.bathrooms = accommodation.bathrooms;
    this.min_stay_nights = accommodation.min_stay_nights;
  }
}
