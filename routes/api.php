<?php

use App\Http\Controllers\FraisController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// http://localhost:8000/api/
Route::prefix('frais')->group(function () {
    Route::get('', [FraisController::class, "liste"]);
    Route::get('{id_visiteur}', [FraisController::class, "fraisVisiteur"]);
    Route::post('ajoutFrais', [FraisController::class, "ajoutFrais"]);
    Route::put('/updatefrais/{id}', [FraisController::class, 'updateFrais']);
    Route::delete('/deleteFrais/{id}', [FraisController::class, 'deleteFrais']);
});
