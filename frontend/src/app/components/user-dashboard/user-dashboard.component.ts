import { Component, ElementRef, OnInit } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { ApiService } from '../api.service';
import { Event } from '../event';
import { Router } from '@angular/router';
import { VieweventGuard } from 'src/app/Guard/viewevent.guard';

@Component({
  selector: 'app-user-dashboard',
  templateUrl: './user-dashboard.component.html',
  styleUrls: ['./user-dashboard.component.css']
})
export class UserDashboardComponent implements OnInit {
  constructor(private fb: FormBuilder, private apiService: ApiService, private elementRef: ElementRef, private router: Router, private viewGuard: VieweventGuard) { }
  events?: Event[];
  event = new Event();

  showFirst: boolean = true;
  page: any;

  EventperPage = 8;
  buttonpg: any;

  toggleSections() {
    this.showFirst = !this.showFirst;
  }

  ngOnInit(): void {
    // this.apiService.addPerson(this.event,"api/publishedEvent")
    //   .subscribe(
    //     data => {
    //       if(data.ArrayOfResponse.length>0){
    //         this.event=data.ArrayOfResponse;
    //         this.events=data.ArrayOfResponse;
    //       }
    //       console.log(this.event)
    //       console.log(data)
    //     }, 
    //     error => {
    //       console.log(error);
    // });
    setTimeout(() => {
      let obj = { Page: 1, EventPerPage: this.EventperPage }
      this.apiService.addPerson(obj, "api/GetEventDataForPage")
        .subscribe(
          data => {
            if (data.ArrayOfResponse.length > 0) {
              this.event = data.ArrayOfResponse;
              this.events = data.ArrayOfResponse;
            }
            console.log(this.event)
            console.log(data.ArrayOfResponse.Startdate)
          },
          error => {
            console.log(error);
          });
    }, 10);
    this.apiService.addPerson(this.page, "api/Eventcount")
      .subscribe(
        data => {
          this.buttonpg = Math.ceil(data / this.EventperPage)
          console.log(this.buttonpg);

        },
        error => {
          console.log(error);
        });

  }

  btnview(id: any) {
    let obj = { Page: id, EventPerPage: this.EventperPage }
    this.apiService.addPerson(obj, "api/GetEventDataForPage")
      .subscribe(
        data => {
          if (data.ArrayOfResponse.length > 0) {
            this.event = data.ArrayOfResponse;
            this.events = data.ArrayOfResponse;
          }
          console.log(this.event)
          console.log(data)
          // console.log();
          
        },
        error => {
          console.log(error);
        });
  }
  btnview1(id: any) {
    this.viewGuard.viewPageFlag = true;
    this.apiService.eventId = id;
    this.router.navigate(["/viewEvent"])
  }
}