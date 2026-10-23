# FitPal

**FitPal is an open-source, mobile-friendly fitness planner that lets people train with the equipment they have.** Exercise animation, customizable weekly routines, workout journals, body measurements, and flexible nutrition ideas.

[![Static website](https://img.shields.io/badge/hosting-GitHub%20Pages-2c5f42)](#deployment) [![Frontend license](https://img.shields.io/badge/code-MIT-blue)](LICENSE)

## Features

- No account required: start a **local guest profile** and choose age, height, baseline weight, available equipment, preferred training duration, and nutrition preferences.
- Starter plans over 6/8/12 weeks or 47 days; selectable daily sessions with warm-up, prescribed sets, reps, conservative suggested loads, and completion checkboxes.
- **Weekly recurring routine builder**: create workouts for specific days, focus on a muscle group (including biceps), pick from presets, and add or remove chosen movements. Multiple routines can be saved, paused, edited, or deleted.
- **One-day exercise replacement** from the illustrated catalog; original routine stays unchanged.
- Visual Exercise Atlas: up to 302 exercise illustrations, search, muscles, equipment filters and favorites (online download from the upstream Workout Guide package).
- Record sets, reps, resistance, walking time, completed sessions, weight, and waist circumference. Export JSON backups and CSV measurements.
- Flexible meal ideas and shopping lists; no fixed starvation diet or promises of extreme weight loss.
- Optional **Supabase email verification** and private cloud sync, **after owner configures credentials and runs SQL schema**.

## Current account status

**Email registration is NOT live by default.** The app automatically runs in browser-local guest mode until a Supabase project is connected. Do not advertise active email verification until it has been configured and tested. There are no email or database secrets in this repository.

## Deployment

The app is plain static HTML/CSS/JS. No build or package installation.

1. Publish the repository to GitHub.
2. In **Settings → Pages**, choose **Deploy from a branch**, `main`, `/ (root)` and save. (If you deploy a feature branch for preview, point Pages at that branch instead.)
3. Site should be available at `https://aryakia.github.io/FitPal/` *after* Pages is enabled and has finished its first build.
4. Check the calendar, workout builder, browser-local storage, and external exercise illustrations on the actual site.

## Email verification and cloud sync (optional)

1. Create a Supabase project; enable **Confirm Email** and configure production SMTP (the default Supabase mail service is not intended for public production registrations).
2. In the Supabase SQL editor execute [`supabase/schema.sql`](supabase/schema.sql). Keep **Row Level Security enabled**; the frontend has no admin key.
3. In **Authentication → URL Configuration**, set **Site URL** to your actual deployed URL, e.g. `https://aryakia.github.io/FitPal/`, and add it to the allowed **Redirect URLs**. Adjust if you use a custom domain.
4. Copy the project URL and its **publishable public key** to [`config.js`](config.js). Never add the Supabase `service_role`/secret key to public GitHub Pages.
5. Verify signup → confirmation email → redirect → sign-in → logging → sign-out; test with **two separate accounts** that one cannot retrieve the other person's data.
6. The user has to explicitly copy a previous **guest** profile into the cloud account after signing in.

**Cloud architecture:** browser Supabase SDK → `public.user_fitness_state`, one JSON payload per auth user. Database RLS restricts SELECT/INSERT/UPDATE/DELETE to matching `auth.uid()`. Records sync automatically after data changes, but the app also offers **Sync now** and JSON exports. It is an early release, not an offline conflict-resolution system; avoid editing the same account simultaneously on multiple devices. If the network fails while saving, **export a backup** rather than assuming sync worked.

## Privacy and safety

- Never upload fitness measurements, medical information, profile backups or session tokens to GitHub.
- Guest mode uses localStorage and is visible to others using the same browser profile.
- Cloud mode sends selected personal profile and workout data to the chosen Supabase project. Review Supabase's data processing terms and publish a privacy notice before public signup.
- Program suggestions are general fitness information, not individualized medical care. Suggested starting loads are estimates, not strength assessments. Prioritize gradual progression, recovery and sustainable weight management.
- This service currently targets **adults aged 18+**.

## Third-party exercise visuals

Exercise illustrations are accessed remotely, not stored in this repository. Attribution: original exercise artwork from [Everkinetic](https://github.com/everkinetic/data), extended/assembled by [Bryl Lim / Workout Guide](https://github.com/bryllim/workout-guide). **Illustrations: [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)**; see [Workout Guide attribution](https://github.com/bryllim/workout-guide/blob/main/ATTRIBUTION.md). This repository's MIT license applies to original FitPal code, **not** to the third-party illustrations.

## Contributing

Use pull requests for frontend fixes, exercise mapping corrections, accessibility improvements or localized nutrition information. Please do not submit personal profiles or health data in issues, screenshots, or test fixtures.
