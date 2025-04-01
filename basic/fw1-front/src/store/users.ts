import { defineStore } from 'pinia'

type States = {
  userList: User[]
}

type Actions = {
  addNewUserToList: (...users: User[]) => void
  getUserList: () => User[]
  reset: () => void
}

export default defineStore<'users', States, {}, Actions>('users', {
  state: () => ({
    userList: [] as User[]
  }),
  actions: {
    addNewUserToList(...users: User[]) {
      this.userList = [...this.userList, ...users]
      return this.userList
    },
    getUserList() {
      return this.userList
    },
    reset() {
      this.userList = []
      return this.userList
    }
  }
})