import { TestBed } from '@angular/core/testing';

import { CookingMethodsService } from './cooking-methods.service';

describe('CookingMethodsService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: CookingMethodsService = TestBed.get(CookingMethodsService);
    expect(service).toBeTruthy();
  });
});
