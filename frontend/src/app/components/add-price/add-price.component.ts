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


  constructor(private fb: FormBuilder,private apiService: ApiService,private elementRef:ElementRef){}


  events?:Event[];
  event = new Event();
  myForm!: FormGroup;
  ngOnInit(): void {
    this.myForm = this.fb.group({
      EventId: ['', Validators.required],
      ActivityName: ['', Validators.required],
      Startdate: ['', [Validators.required]],
      Enddate: ['', [Validators.required]]
    });
    this.apiService.addPerson(this.event,"api/getActiveEvent")
      .subscribe(
        data => {
          if(data.ArrayOfResponse.length>0){
            this.events=data.ArrayOfResponse;
          console.log(this.events)
          }
          
        }, 
        error => {
          console.log(error);
    });
    this.myForm = this.fb.group({
      EventId: ['', Validators.required],
      ActivityId: ['', [Validators.required]],
      ActivityPrice:['', [Validators.required,Validators.pattern(/^-?([1-9]\d*)?$/)]]
    });
  }

  activitys?:Activity[];
  activity = new Activity();

  onFileChange (form: FormGroup) {
    this.activity.EventId=form.value.EventId;
    this.apiService.addPerson(this.activity,"api/getActivity")
      .subscribe(
        data => {
          if(data.ArrayOfResponse.length>0){
            this.activitys=data.ArrayOfResponse;
            console.log(this.activitys)
          }else{
            this.activitys=[];
          }
          
        }, 
        error => {
          console.log(error);
    });
  }

  activitys2?:Activity[];
  activity2 = new Activity();
  ResponseMessage?:string;
  onSubmit(form: FormGroup) {
    console.log('Valid?', form.valid); // true or false

    this.activity2.Id=form.value.ActivityId;
    this.activity2.Price=form.value.ActivityPrice;
    if(form.valid){
    this.apiService.addPerson(this.activity2,"api/addPrice")
    .subscribe(
      data => {
        console.log(data);
        this.ResponseMessage=data;
        // var d1 = this.elementRef.nativeElement.querySelector('#priceMessage');
        // d1.innerHTML="";
        // d1.insertAdjacentHTML('beforeend', '<div class="two"><b>'+data+'</b></div>');
      }, 
      error => {
        console.log(error);
      });
    }
    else{
      alert("Enter valid values")
    }
  }
}
