import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { FormsModule, ReactiveFormsModule } from '@angular/forms'
import { AppComponent } from './app.component';
import { UiModule } from './ui/ui.module';
import { CategoryComponent } from './category/category.component';

import { HttpClientModule } from '@angular/common/http';
import { CategoryByIdComponent } from './category-by-id/category-by-id.component';
import { CategoryByNameComponent } from './category-by-name/category-by-name.component';
import { CookingMethodsComponent } from './cooking-methods/cooking-methods.component';
import { ProductsComponent } from './products/products.component';
import { SearchComponent } from './search/search.component';
import { CategoryService } from './category/category.service';
@NgModule({
  declarations: [
    AppComponent,
    CategoryComponent,
    CategoryByIdComponent,
    CategoryByNameComponent,
    CookingMethodsComponent,
    ProductsComponent,
    
    SearchComponent
    
  ],
  imports: [
    BrowserModule,
    UiModule,  
    FormsModule,
    ReactiveFormsModule , 
    HttpClientModule
    
  ],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule { }
