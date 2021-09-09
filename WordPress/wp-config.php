<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

define ( 'WP_HOME', 'http://192.168.100.54:81' );
define ( 'WP_SITEURL', 'http://192.168.100.54:81' );

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'client' );

/** MySQL database password */
define( 'DB_PASSWORD', '458658' );

/** MySQL hostname */
define( 'DB_HOST', '192.168.100.46:3306' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'v`8*`,_<*])a1HjK$a5O+@HMr-j};I*$~XpSpB]+h}jy5}Tis so;%=hY/DOsZdo' );
define( 'SECURE_AUTH_KEY',  'kL%$@`,,P/nb!@@%* u+P AbaH`$oA>{k0TzO274N lVR|TH!@6Hl~og6z*J?R^X' );
define( 'LOGGED_IN_KEY',    'zMQR[rC}Ql1eTJ$8UbiYnF<nXX@z!=h[Xq6]~x*+@Bt=cpTxagkhHNq!73XBMWlo' );
define( 'NONCE_KEY',        'wiUy99BYqxI-iZ@l>[D{K+ABQ[a;dj~t$KpVj28M `4<EzEeb_ K3i8fkPzEx[Tm' );
define( 'AUTH_SALT',        '7&8!y@F9}(<-[.L:y[4e$cVRj9HyJPccL<*iqy2ST7wl}.33kh,2Ke@CYXwY7A<H' );
define( 'SECURE_AUTH_SALT', 'QO]r-K1>ss`y<R?{yzbizSAsu!DblN<=3U&UU=ltgu!m)v+Gy<#zL /vEf8jI_=z' );
define( 'LOGGED_IN_SALT',   'wy7wH[+f6|XWu|2o:O0*f._^}1}HyAp#6|+b1Q:C0Yk+kR2cQcM2[l{_j{31+&Ri' );
define( 'NONCE_SALT',       '2k#{Muc~_;PVP20uNYjp^)S?5^s>B1HkyApmHcoOj,-gp(EHy3y(4GS?^#0Q.^SM' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
