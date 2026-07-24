/**
 * JimmyTheHat Bot — Server Setup Script
 *
 * Run ONCE to auto-create all channels, roles, and the welcome message.
 * After this runs, your Discord server is fully built.
 *
 * Usage:
 *   1. Set env var:  [Environment]::SetEnvironmentVariable("DISCORD_BOT_TOKEN","your_token","User")
 *   2. Restart your terminal (so the env var loads)
 *   3. cd bot && npm install && npm run setup
 *
 * The bot token is read from the environment — NEVER hardcoded.
 */

import { Client, GatewayIntentBits, ChannelType, PermissionFlagsBits } from 'discord.js';

const token = process.env.DISCORD_BOT_TOKEN;

if (!token) {
  console.error('❌ DISCORD_BOT_TOKEN not found in environment.');
  console.error('   Set it with: [Environment]::SetEnvironmentVariable("DISCORD_BOT_TOKEN","your_token","User")');
  console.error('   Then restart your terminal.');
  process.exit(1);
}

// Channels to create (name → optional topic)
const CHANNELS = [
  { name: 'welcome',        topic: 'Read before posting — rules and how to get started' },
  { name: 'announcements',  topic: 'Maintainer-only — releases, events, news' },
  { name: 'general',        topic: 'Casual chat' },
  { name: 'dev-help',       topic: 'Coding questions — TypeScript, Phaser, engine help' },
  { name: 'art-share',      topic: 'Asset work-in-progress — show your stuff' },
  { name: 'design-talk',    topic: 'Mechanics, GDD, game design discussion' },
  { name: 'first-prs',      topic: 'I claimed X, here is my PR — check-ins' },
  { name: 'off-topic',      topic: 'Non-work banter' },
];

// Roles to create (name → permissions)
const ROLES = [
  {
    name: 'Mentor',
    color: 0x58a6ff,
    permissions: [
      PermissionFlagsBits.ManageMessages,
      PermissionFlagsBits.PinMessages,
      PermissionFlagsBits.CreateInstantInvite,
      PermissionFlagsBits.KickMembers,
    ],
  },
  {
    name: 'Volunteer',
    color: 0x3fb950,
    permissions: [
      PermissionFlagsBits.SendMessages,
      PermissionFlagsBits.AttachFiles,
      PermissionFlagsBits.ReadMessageHistory,
      PermissionFlagsBits.AddReactions,
      PermissionFlagsBits.UseExternalEmojis,
    ],
  },
];

const WELCOME_MESSAGE = `Welcome to JimmyTheHat Games Volunteers! 🎮

We're a small indie studio building pixel-art games in TypeScript + Phaser 3. This Discord is for volunteers who want real repo experience with mentorship.

**Get started:**
1. Read the volunteer guide: https://github.com/subtiliorars-sys/jimmythehat-volunteers
2. Pick a task from the good-first-issues: https://github.com/subtiliorars-sys/jimmythehat-volunteers/blob/main/docs/GOOD_FIRST_ISSUES.md
3. Comment on the issue to claim it
4. Drop a message in <#FIRST_PRS_ID> when you open your PR

**Rules:**
• Be kind, be patient — we're all learning
• No self-promotion outside #off-topic
• 16+ (parental consent under 18)
• Code of conduct: https://github.com/subtiliorars-sys/jimmythehat-volunteers/blob/main/docs/onboarding/code-of-conduct.md

Questions? Ask in #general or #dev-help. A mentor will respond.`;

async function setup() {
  const client = new Client({
    intents: [GatewayIntentBits.Guilds],
  });

  console.log('⏳ Connecting to Discord...');
  await client.login(token);
  await new Promise(r => client.once('ready', r));
  console.log(`✅ Logged in as ${client.user.tag}`);

  const guilds = client.guilds.cache;
  if (guilds.size === 0) {
    console.error('❌ Bot is not in any server. Invite it first using the OAuth2 URL from the Developer Portal.');
    process.exit(1);
  }
  if (guilds.size > 1) {
    console.log(`⚠️  Bot is in ${guilds.size} servers. Using: ${guilds.first().name}`);
  }

  const guild = guilds.first();
  console.log(`📍 Target server: ${guild.name} (${guild.id})`);

  // --- Create roles ---
  console.log('\n--- Creating roles ---');
  const createdRoles = {};
  for (const roleDef of ROLES) {
    const existing = guild.roles.cache.find(r => r.name === roleDef.name);
    if (existing) {
      console.log(`  ✓ Role "${roleDef.name}" already exists — skipping`);
      createdRoles[roleDef.name] = existing;
      continue;
    }
    const role = await guild.roles.create({
      name: roleDef.name, color: roleDef.color,
      permissions: roleDef.permissions, reason: 'JimmyTheHat bot setup',
    });
    createdRoles[roleDef.name] = role;
    console.log(`  ✅ Created role: ${role.name}`);
  }

  // --- Create channels ---
  console.log('\n--- Creating channels ---');
  const createdChannels = {};
  for (const chDef of CHANNELS) {
    const existing = guild.channels.cache.find(c => c.name === chDef.name && c.type === ChannelType.GuildText);
    if (existing) {
      console.log(`  ✓ Channel #${chDef.name} already exists — skipping`);
      createdChannels[chDef.name] = existing;
      continue;
    }
    const channel = await guild.channels.create({
      name: chDef.name, type: ChannelType.GuildText,
      topic: chDef.topic, reason: 'JimmyTheHat bot setup',
    });
    createdChannels[chDef.name] = channel;
    console.log(`  ✅ Created channel: #${channel.name}`);
  }

  // --- Post welcome message ---
  console.log('\n--- Posting welcome message ---');
  const welcomeChannel = createdChannels['welcome'];
  let message = WELCOME_MESSAGE.replace('<#FIRST_PRS_ID>', `<#${createdChannels['first-prs'].id}>`);
  const existingMessages = await welcomeChannel.messages.fetch({ limit: 5 });
  const alreadyPosted = existingMessages.some(m => m.author.id === client.user.id);
  if (alreadyPosted) {
    console.log('  ✓ Welcome message already posted — skipping');
  } else {
    await welcomeChannel.send(message);
    console.log('  ✅ Welcome message posted to #welcome');
  }

  console.log('\n========================================');
  console.log('🎉 Server setup complete!');
  console.log('========================================');
  console.log(`   Server: ${guild.name}`);
  console.log(`   Roles: ${Object.keys(createdRoles).join(', ')}`);
  console.log(`   Channels: ${Object.keys(createdChannels).join(', ')}`);
  console.log('\nNext steps:');
  console.log('  1. Give yourself the Mentor role (Server Settings → Members)');
  console.log('  2. Create an invite link (Server name → Invite People → Edit → Never expire)');
  console.log('  3. Add the invite link to your Reddit post + GitHub README');

  client.destroy();
  process.exit(0);
}

setup().catch(err => {
  console.error('❌ Setup failed:', err);
  process.exit(1);
});