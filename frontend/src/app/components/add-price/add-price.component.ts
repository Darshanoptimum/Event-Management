import { Component, ElementRef } from '@angular/core';
import { Event } from '../event';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ApiService } from '../api.service';
import { Activity } from '../activity';

@Component({
  selector: 'app-add-price',
  templateUrl: './add-price.component.html',
  styleUrls: ['./add-price.component.css']
})
export class AddPriceComponent {
  
  events?: Event[];
  event = new Event();
  myForm!: FormGroup;
  activitys?: Activity[];
  activity = new Activity();
  activitys2?: Activity[];
  activity2 = new Activity();
  ResponseMessage?: string;
  message=false;
  selectflag=false;

  constructor(private fb: FormBuilder, private apiService: ApiService, private elementRef: ElementRef) { }

  ngOnInit(): void {
    this.myForm = this.fb.group({
      EventId: ['', Validators.required],
      ActivityName: ['', Validators.required],
      Startdate: ['', [Validators.required]],
      Enddate: ['', [Validators.required]]
    });
    // call api for get non publish event
    this.apiService.addPerson(this.event, "api/getActiveEvent")
      .subscribe(
        data => {
          if (data.ArrayOfResponse.length > 0) {
            this.events = data.ArrayOfResponse;
            console.log(this.events)
          }
        },
        error => {
          alert("Error")
          console.log(error);
        });
    this.myForm = this.fb.group({
      EventId: ['', Validators.required],
      ActivityId: ['', [Validators.required]],
      ActivityPrice: ['', [Validators.required, Validators.pattern(/^-?([1-9]\d*)?$/)]]
    });
  }

  // Addmin select the event after that this method get Activity of selected event
  onFileChange(form: FormGroup) {
    this.selectflag=true;
    this.activity.EventId = form.value.EventId;
    this.apiService.addPerson(this.activity, "api/getActivity")
      .subscribe(
        data => {
          if (data.ArrayOfResponse.length > 0) {
            this.activitys = data.ArrayOfResponse;
            console.log(this.activitys)
            this.message=true
          } else {
            this.activitys = [];
            this.message=false
          }
        },
        error => {
          console.log(error);
        });
  }


  onSubmit(form: FormGroup) {
    this.activity2.Id = form.value.ActivityId;
    this.activity2.Price = form.value.ActivityPrice;
    if (form.valid) {
      // call api for add event price
      this.apiService.addPerson(this.activity2, "api/addPrice")
        .subscribe(
          data => {
            console.log(data);
            this.ResponseMessage = data;
          },
          error => {
            alert("Error")
            console.log(error);
          });
    }
    else {
      alert("Enter valid values")
    }
  }
}
