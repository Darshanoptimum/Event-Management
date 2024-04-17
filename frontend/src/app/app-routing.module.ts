import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Route, RouterModule, Routes } from '@angular/router';
import { SignupComponent } from './components/signup/signup.component';
import { AdminDashboardComponent } from './components/admin-dashboard/admin-dashboard.component';
import { AdminGuard } from './Guard/admin.guard';
import { UserGuard } from './Guard/user.guard';
import { ViewEventComponent } from './components/view-event/view-event.component';
import { HomePageComponent } from './components/home-page/home-page.component';
import { VieweventGuard } from './Guard/viewevent.guard';
import { AdminHomePageComponent } from './components/admin-home-page/admin-home-page.component';
import { UserDashboardComponent } from './components/user-dashboard/user-dashboard.component';

const routes: Routes = [
  {
    path: "home", component: HomePageComponent
  },
  {
    path: "login", component: SignupComponent
  },
  
  {
    path:"admindashboard", component:AdminDashboardComponent,
    canActivate: [AdminGuard]
  },
  { path: 'datechange', component: AdminHomePageComponent },
  {
    path:"userdashboard", component:UserDashboardComponent,
    canActivate: [UserGuard]
  },
  {
    path:"viewEvent", component:ViewEventComponent,canActivate: [VieweventGuard,UserGuard]
  },
  { path: '**', component: HomePageComponent },


  ]

@NgModule({
  declarations: [],
  imports: [
    RouterModule.forRoot(routes)
  ],
  exports:[RouterModule]
})
export class AppRoutingModule {
  
  
 }
