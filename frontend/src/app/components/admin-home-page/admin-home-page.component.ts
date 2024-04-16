import { Component, ElementRef } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { ApiService } from '../api.service';
import { Event } from '../event';

@Component({
  selector: 'app-admin-home-page',
  templateUrl: './admin-home-page.component.html',
  styleUrls: ['./admin-home-page.component.css']
})
export class AdminHomePageComponent {
  constructor(private fb: FormBuilder,private apiService: ApiService,private elementRef:ElementRef){}

  events? : Event[]
  event : any;
  ngOnInit(): void {
    
    this.apiService.addPerson(this.event,"api/publishedEvent")
      .subscribe(
        data => {
          if(data.ArrayOfResponse.length>0){
            this.events=data.ArrayOfResponse;
            this.events=data.ArrayOfResponse;
          }
          console.log(this.events)
          console.log(data)
        }, 
        error => {
          console.log(error);
    });
  }
 
  
}
