<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {

    $git_branch = '';
    $head_file = '/GIT_BRANCH_INFO';

    if (file_exists($head_file)) {
        $git_branch = file_get_contents($head_file);
        $git_branch = explode('/', $git_branch);
        $git_branch = end($git_branch);
    }

    return view('welcome', [
      'git_branch_name' => $git_branch,
    ]);
});