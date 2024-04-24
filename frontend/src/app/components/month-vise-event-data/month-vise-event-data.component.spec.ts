import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MonthViseEventDataComponent } from './month-vise-event-data.component';

describe('MonthViseEventDataComponent', () => {
  let component: MonthViseEventDataComponent;
  let fixture: ComponentFixture<MonthViseEventDataComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MonthViseEventDataComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(MonthViseEventDataComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
