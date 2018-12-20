import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CookingMethodsComponent } from './cooking-methods.component';

describe('CookingMethodsComponent', () => {
  let component: CookingMethodsComponent;
  let fixture: ComponentFixture<CookingMethodsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CookingMethodsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CookingMethodsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
