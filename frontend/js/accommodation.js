class Accommodation {
  constructor(accommodation) {
    console.log(accommodation);
    this.id = accommodation.id;
    this.title = accommodation.title;
    this.type = accommodation.type.name;
    this.city = accommodation.city;
    this.max_guests = accommodation.max_guests;
  }
}
