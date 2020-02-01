var app = new Vue({
  el: '#app',
  data: {
    backend_input: '',
    backend_url: "http://localhost:3000",
    accommodation: new Accommodation({ title: '', type: { name: '' }, city: '', max_guests: '' }),
    search: '',
    accommodations: [],
    showSpinner: true
  },

  methods: {
    itemClicked: function(accommodation) {
      this.accommodation = accommodation;
      console.log("fetching for " + accommodation.id)
      this.showSpinner = true;
      $("#accommodation-modal").modal('show');
      if(accommodation.country === undefined) {
        $.getJSON(this.backend_url + '/accommodations/' + accommodation.id, function(data) {
          setTimeout(function() {
            console.log("got data: " + data);
            this.setAccommodation(accommodation, data);
            this.showSpinner = false;
          }.bind(this), 1000);
        }.bind(this));
      } else {
        this.showSpinner = false;
      }
    },
    showBackendUrl: function() {
      $("#backend-url-modal").modal('show');
    },
    setBackendUrl: function() {
      this.backend_url = this.backend_input;
      this.backend_input = '';
      this.fetchAccommodations();
      $("#backend-url-modal").modal('hide');
    },
    fetchAccommodations: function() {
      $.ajaxSetup({ cache: false });
      $.getJSON(this.backend_url + '/accommodations/', function(data) {
        this.setAccommodations(data);
      }.bind(this));
    },
    setAccommodations: function(accommodations) {
      console.log(accommodations);
      this.accommodations = accommodations.map(accommodation => new Accommodation(accommodation))
    },
    setAccommodation: function(accommodation, data) {
      accommodation.country = data.country;
      accommodation.floor_area = data.floor_area;
      accommodation.bedrooms = data.bedrooms;
      accommodation.bathrooms = data.bathrooms;
      accommodation.min_stay_nights = data.min_stay_nights;

      this.accommodation = accommodation;
    }
  },

  mounted: function() {
    setTimeout(function(){
      this.fetchAccommodations();
    }.bind(this), 100);
  },

  computed: {
    filteredList: function filteredList() {
      var _this = this;
      return this.accommodations.filter(function(accommodation) {
        included = false;

        if(accommodation.city.toLowerCase().includes(_this.search.toLowerCase()))
          included = true;

        if(accommodation.type.toLowerCase().includes(_this.search.toLowerCase()))
          included = true;

        return included;
      });
    }
  }
});
