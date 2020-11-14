package inhatc.capstone.market.msg.server.model;

import java.util.Set;

public class UsersMessageVO implements Message{
	private Set<String> users = null;
	public UsersMessageVO(Set<String> users) {
		this.users = users;
	}
	public Set<String> getUsers(){
		return users;
	}
	public void setUsers(Set<String> users) {
		this.users = users;
	}
}
