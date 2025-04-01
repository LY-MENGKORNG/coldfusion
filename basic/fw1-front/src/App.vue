<template>
	<div>
		<h2>Users List</h2>
		<ul v-if="users.length">
			<li
				v-for="user in users"
				:key="user.id">
				{{ user.username }}</li
			>
		</ul>
		<p v-else>No users found</p>
		<v-btn
			variant="tonal"
			@click="addUser"
			>Add User</v-btn
		>
		<v-btn
			variant="elevated"
			@click="resetList"
			>Reset</v-btn
		>
	</div>
</template>

<script setup lang="ts">
	import { computed } from 'vue'
	import { usersStore } from '@/store'
	const { addNewUserToList, getUserList, reset } = usersStore()

	const users = computed(() => getUserList())
	const addUser = () => {
		addNewUserToList({
			id: Math.random(),
			username: `User ${users.value.length + 1}`,
		})
	}
	const resetList = () => {
		reset()
	}
</script>

<style lang="scss" src="./sass/app.scss"></style>
