import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpErrorResponse } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { map, catchError, tap } from 'rxjs/operators';



const endpoint = 'http://localhost:8000/foodpark/';
const httpOptions = {
  headers: new HttpHeaders({
    'Content-Type':  'application/json',
    'Authorization': 'testtoken'
  })
};

@Injectable({
  providedIn: 'root'
})
export class CookingMethodsService {

  private extractData(res: Response) {
    let body = res;
    return body || { };
  }

  private handleError<T> (operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {
  
      // TODO: send the error to remote logging infrastructure
      console.error(error); // log to console instead
  
      // TODO: better job of transforming error for user consumption
      console.log(`${operation} failed: ${error.message}`);
  
      // Let the app keep running by returning an empty result.
      return of(result as T);
    };
  }
  constructor(private http: HttpClient) { }

  getCookingMethods(): Observable<any> {
    return this.http.get(endpoint + 'cooking_methods/get',httpOptions).pipe(
      map(this.extractData));
  }

  getCategorysByName(id): Observable<any> {
    return this.http.get(endpoint + 'cooking_methods/get/'+id,httpOptions).pipe(
      map(this.extractData));
  }

  
}
