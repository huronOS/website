// @ts-check
// Note: type annotations allow type checking and IDEs autocompletion

const lightCodeTheme = require("prism-react-renderer/themes/github");
const darkCodeTheme = require("prism-react-renderer/themes/dracula");
const path = require("path")

/** @type {import('@docusaurus/types').Config} */
const config = {
	title: "huronOS",
	tagline: "A GNU / Linux distribution for competitive programming",
	favicon: "img/favicon.ico",

	// Set the production url of your site here
	url: "https://huronos.org",
	// Set the /<baseUrl>/ pathname under which your site is served
	// For GitHub pages deployment, it is often '/<projectName>/'
	baseUrl: "/",

	// GitHub pages deployment config.
	// If you aren't using GitHub pages, you don't need these.
	organizationName: "huronOS", // Usually your GitHub org/user name.
	projectName: "huronOS-website", // Usually your repo name.

	onBrokenLinks: "warn",
	onBrokenMarkdownLinks: "warn",

	// Even if you don't use internalization, you can use this field to set useful
	// metadata like html lang. For example, if your site is Chinese, you may want
	// to replace "en" with "zh-Hans".
	i18n: {
		defaultLocale: "en",
		locales: ["en"],
	},

	presets: [
		[
			"classic",
			/** @type {import('@docusaurus/preset-classic').Options} */
			({
				docs: {
					sidebarPath: require.resolve("./sidebars.js"),
					// Please change this to your repo.
					// Remove this to remove the "edit this page" links.
					// editUrl:
					// 'https://github.com/facebook/docusaurus/tree/main/packages/create-docusaurus/templates/shared/',
				},
				blog: {
					showReadingTime: true,
					// Please change this to your repo.
					// Remove this to remove the "edit this page" links.
					// editUrl:
					// 'https://github.com/facebook/docusaurus/tree/main/packages/create-docusaurus/templates/shared/',
				},
				theme: {
					customCss: require.resolve("./src/css/custom.css"),
				},
			}),
		],
	],

	themeConfig:
		/** @type {import('@docusaurus/preset-classic').ThemeConfig} */
		({
			// Replace with your project's social card
			//image: "img/docusaurus-social-card.jpg",
			announcementBar: {
				id: 'alpha-v0.3',
				content:
				  '<b>Hey, alpha-v0.3 has just been released! <a target="_blank" href="https://github.com/equetzal/huronOS-build-tools/releases">check the release notes.</a></b>',
				backgroundColor: '#94A2E8',
				textColor: '#000',
				isCloseable: true,
			  },
			navbar: {
				title: "huronOS",
				logo: {
					alt: "huron os logo",
					src: "img/logo.svg",
				},
				items: [
					{ to: "/download", label: "Download", position: "left" },
					{
						type: "docSidebar",
						sidebarId: "tutorialSidebar",
						position: "left",
						label: "Docs",
					},
					/*{ to: "/blog", label: "Blog", position: "left" },*/
					{
						type: "dropdown",
						label: "Contribute",
						position:"left",
						items: [
							{
								label: "Collaborate",
								to: "/collaborate",
							},
							{
								label: "Donate",
								to: "/donate"
							}
						]
					},
					{
						href: "https://github.com/equetzal/huronOS-build-tools",
						label: "GitHub",
						position: "right",
					},
				],
			},
			footer: {
				style: "dark",
				links: [
					{
						title: "Docs",
						items: [
							{
								label: "Introduction",
								to: "/docs/introduction",
							},
							{
								label: "About",
								to: "/docs/category/about-huronos",
							},
							{
								label: "Install",
								to: "/docs/usage/how-to-install",
							},
						],
					},
					{
						title: "Community",
						items: [
							{
								label: "Discord",
								href: "https://discord.gg/NVZ6vJmm5q",
							},
							{
								label: "Telegram",
								href: "https://t.me/+5IjLAE7MpW05OGNh",
							},
						],
					},
					{
						title: "More",
						items: [
							{
								label: "Collaborate",
								to: "collaborate/"
							},
							{
								label: "Donate",
								to: "donate/"
							},
							/*{
								label: "Blog",
								to: "/blog",
							},*/
							{
								label: "GitHub",
								href: "https://github.com/equetzal/huronOS-build-tools",
							},
						],
					},
				],
				copyright: `Copyright © ${new Date().getFullYear()}, huronOS. Built with Docusaurus.`,
			},
			prism: {
				theme: lightCodeTheme,
				darkTheme: darkCodeTheme,
				additionalLanguages: ['bash'],
			},
		}),

		plugins: [require.resolve(path.join(__dirname, '/plugins/symlink-resolver'))]
};

module.exports = config;
