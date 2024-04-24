import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';


import { AppComponent } from './app.component';
import { NavComponent } from './components/nav/nav.component';
import { SignupComponent } from './components/signup/signup.component';
import { ReactiveFormsModule } from '@angular/forms';

import { HttpClientModule, HttpClient } from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { Router, RouterModule, Routes } from '@angular/router';
import { AdminDashboardComponent } from './components/admin-dashboard/admin-dashboard.component';
import { AddEventComponent } from './components/add-event/add-event.component';
import { AddActivityComponent } from './components/add-activity/add-activity.component';
import { AddPriceComponent } from './components/add-price/add-price.component';
import { PublishEventComponent } from './components/publish-event/publish-event.component';
import { UserDashboardComponent } from './components/user-dashboard/user-dashboard.component';
import { ViewEventComponent } from './components/view-event/view-event.component';
import { UserGuard } from './Guard/user.guard';
import { AdminGuard } from './Guard/admin.guard';
import { HomePageComponent } from './components/home-page/home-page.component';
import { AdminHomePageComponent } from './components/admin-home-page/admin-home-page.component';
import { ChangeDatePipe } from './change-date.pipe';
import { AfterdatePipe } from './afterdate.pipe';
import { GoogleLoginProvider, SocialAuthServiceConfig, SocialLoginModule } from 'angularx-social-login';
import { AllEventComponent } from './components/all-event/all-event.component';
import { MonthViseEventComponent } from './components/month-vise-event/month-vise-event.component';
import { MonthViseEventDataComponent } from './components/month-vise-event-data/month-vise-event-data.component';

@NgModule({
  declarations: [
    AppComponent,
    NavComponent,
    SignupComponent,
    AdminDashboardComponent,
    AddEventComponent,
    AddActivityComponent,
    AddPriceComponent,
    PublishEventComponent,
    UserDashboardComponent,
    ViewEventComponent,
    HomePageComponent,
    AdminHomePageComponent,
    ChangeDatePipe,
    AfterdatePipe,
    AllEventComponent,
    MonthViseEventComponent,
    MonthViseEventDataComponent,


  ],
  imports: [
    BrowserModule,
    ReactiveFormsModule, HttpClientModule, AppRoutingModule, RouterModule,SocialLoginModule,
  ],
  exports:[
  ],
  providers: [{
    provide: 'SocialAuthServiceConfig',
    useValue: {
      autoLogin: false, 
      providers: [
        {
          id: GoogleLoginProvider.PROVIDER_ID,
          provider: new GoogleLoginProvider('950826798617-q8k3b869n3v96nd4lr47d7n7g5rhcen7.apps.googleusercontent.com') // your client id
        }
      ]
    } as SocialAuthServiceConfig,
  },],
  bootstrap: [AppComponent]

})
export class AppModule {

}
