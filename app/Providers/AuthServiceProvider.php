<?php
 
namespace App\Providers;
 
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;
use Laravel\Passport\Passport;
<<<<<<< HEAD

=======
 
>>>>>>> 8dcea263367dc0c4dce767e13243cf31e543428b
class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        'App\Models\Model' => 'App\Policies\ModelPolicy',
    ];
 
    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {        
        $this->registerPolicies();

<<<<<<< HEAD
        if (! $this->app->routesAreCached()) {
            Passport::routes();
        }
=======
        if (!$this->app->routesAreCached()) {
            Passport::routes(); 
        }

        Passport::tokensExpireIn(now()->addDays(15));
        Passport::refreshTokensExpireIn(now()->addDays(30));
        Passport::personalAccessTokensExpireIn(now()->addMonths(6));
>>>>>>> 8dcea263367dc0c4dce767e13243cf31e543428b
    }
}
