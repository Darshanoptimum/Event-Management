import { Component, ElementRef } from '@angular/core';
import { Event } from '../event';
import { FormBuilder } from '@angular/forms';
import { Router } from '@angular/router';
import { VieweventGuard } from 'src/app/Guard/viewevent.guard';
import { ApiService } from '../api.service';

@Component({
  selector: 'app-all-event',
  templateUrl: './all-event.component.html',
  styleUrls: ['./all-event.component.css']
})
export class AllEventComponent {
  events?: Event[];
  event = new Event();
  showFirst: boolean = true;
  page: any;
  EventperPage = 8;
  buttonpg: any;
  indexofpage!: number;

  constructor(private fb: FormBuilder, private apiService: ApiService, private elementRef: ElementRef, private router: Router, private viewGuard: VieweventGuard) { }

  ngOnInit(): void {
    // setInterval(() => {},1000);
    setTimeout(() => {
      let obj = { Page: 1, EventPerPage: this.EventperPage }
      // call api for first page data
      this.apiService.addPerson(obj, "api/GetEventDataForPage")
        .subscribe(
          data => {
            if (data.ArrayOfResponse.length > 0) {
              this.event = data.ArrayOfResponse;
              this.events = data.ArrayOfResponse;
              this.indexofpage = 0;
            }
            // console.log(this.event)
            // console.log(data.ArrayOfResponse.Startdate)
          },
          error => {
            alert("Error")
            console.log(error);
          });
    }, 10);
    // call api for count of reponse event
    this.apiService.addPerson(this.page, "api/Eventcount")
      .subscribe(
        data => {
          if(data<this.EventperPage){
            this.buttonpg=this.EventperPage
          }else{
            this.buttonpg = Math.ceil(data / this.EventperPage)
          }
         
          // console.log(this.buttonpg);

        },
        error => {
          console.log(error);
        });
  }
  // call api for specific page data
  btnview(id: any) {
    let obj = { Page: id, EventPerPage: this.EventperPage }
    this.apiService.addPerson(obj, "api/GetEventDataForPage")
      .subscribe(
        data => {
          if (data.ArrayOfResponse.length > 0) {
            this.event = data.ArrayOfResponse;
            this.events = data.ArrayOfResponse;
            this.indexofpage = (id - 1) * this.EventperPage;
          }
          // console.log(this.event)
          // console.log(data)
        },
        error => {
          alert("Error")
          console.log(error);
        });
  }
  // redirect page click on buttun for view more
  btnview1(id: any) {
    this.viewGuard.viewPageFlag = true;
    this.apiService.eventId = id;
    this.router.navigate(["/viewEvent"])
  }
  refreshTimer() {
    setTimeout("location.reload(true);",6000);
}


}
