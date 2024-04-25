import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MonthViseEventComponent } from './month-vise-event.component';

describe('MonthViseEventComponent', () => {
  let component: MonthViseEventComponent;
  let fixture: ComponentFixture<MonthViseEventComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MonthViseEventComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(MonthViseEventComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });

  
});
