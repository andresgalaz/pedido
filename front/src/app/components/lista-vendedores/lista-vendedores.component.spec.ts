import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListaVendedoresComponent } from './lista-vendedores.component';

describe('LisatVendedoresComponent', () => {
  let component: ListaVendedoresComponent;
  let fixture: ComponentFixture<ListaVendedoresComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ListaVendedoresComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ListaVendedoresComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
