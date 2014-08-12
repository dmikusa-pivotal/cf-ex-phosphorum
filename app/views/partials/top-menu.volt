<header>
	<nav class="navbar navbar-reverse" role="navigation">
	  <div class="container-fluid">
		<div class="navbar-header">
		  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		  </button>
		  {{ link_to('', 'Phosphorum', 'class': 'navbar-brand') }}
		</div>

		<div class="collapse navbar-collapse">
		  <ul class="nav navbar-nav navbar-right">

			<li>{{ link_to('', '<span class="glyphicon glyphicon-comment"></span>', 'title': 'Discussions') }}</li>
			<li class="dropdown">
          		<a href="#" class="dropdown-toggle" data-toggle="dropdown" title="Search">
          			<span class="glyphicon glyphicon-search"></span> <b class="caret"></b>
          		</a>
          		<ul class="dropdown-menu">
					<li>
						<div style="width:300px">
							<gcse:searchbox-only></gcse:searchbox-only>
						</div>
					</li>
				</ul>
          	</li>
			<li>{{ link_to('activity', '<span class="glyphicon glyphicon-eye-open"></span>', 'title': 'Activity') }}</li>

			{%- if session.get('identity') -%}
			<li class="notification-container">
				{{- link_to('notifications', '<span class="glyphicon glyphicon-globe"></span>', 'title': 'Notifications') -}}
				{%- if notifications.has() -%}
				<span class="notification-counter">{{ notifications.getNumber() }}</span>
				{%- endif -%}
			</li>
			{%- endif -%}

			<li class="dropdown">

				<a href="#" class="dropdown-toggle categories-link" data-toggle="dropdown" title="Categories">
					<span class="glyphicon glyphicon-th-list"></span> <b class="caret"></b>
				</a>

				<ul class="dropdown-menu" id="categories-dropdown">
				{%- cache "sidebar" -%}
						{%- if categories is defined -%}
							{%- for category in categories -%}
								<li>
									{{- link_to('category/' ~ category.id ~ '/' ~ category.slug,
										category.name ~ '<span class="label label-default" style="float: right">' ~ category.number_posts ~ '</span>')
									-}}
								</li>
							{%- endfor -%}
						{%- endif -%}
				{%- endcache -%}
				</ul>
			</li>

			<li>{{ link_to('help', '<span class="glyphicon glyphicon-question-sign"></span>', 'title': 'Help') }}</li>

			{%- if session.get('identity') -%}
			<li>{{ link_to('settings', '<span class="glyphicon glyphicon-cog"></span>', 'title': 'Settings') }}</li>
			<li>{{ link_to('logout', '<span class="glyphicon glyphicon-off"></span>', 'title': 'Logout') }}</li>
			{%- endif -%}
		  </ul>

			{%- if session.get('identity') -%}
				{{ link_to('post/discussion', 'Start a Discussion', 'class': 'btn btn-default btn-info navbar-btn navbar-right', 'rel': 'nofollow') }}
			{%- else -%}
				{{ link_to('login/oauth/authorize', 'Log In with Github', 'class': 'btn btn-default btn-info navbar-btn navbar-right', 'rel': 'nofollow') }}
			{%- endif -%}


		</div>
	  </div>
	</nav>
</header>
