<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Auth;
use App\Models\Role;

class RoleMiddleware
{
    public function handle(Request $request, Closure $next): Response
    {
        $user = Auth::user();
        if(Auth::check() && $user->role->has_permission($request->route()->getName(), Auth::user()->role->id)){
            return redirect()->route('home');
        }
        return $next($request);
    }
}
