package com.mob.dto;

import com.mob.model.group.Group;
import com.mob.model.group.GroupAdmin;
import com.mob.model.profile.Profile;

public class GroupMember {
	
	  private Profile profile;
	  private Group group;
	  private boolean admin;
	  private GroupAdmin groupAdmin;
	  private GroupAdmin groupOwner;
	  private long joinGroupMember;
	    public GroupMember(){
	        
	    }
	    
	    public void setProfile(Profile profile){
	        this.profile = profile;
	    }
	    
	    public Profile getProfile(){
	        return this.profile;
	    }

		public boolean isAdmin() {
			return admin;
		}

		public void setAdmin(boolean admin) {
			this.admin = admin;
		}

		public Group getGroup() {
			return group;
		}

		public void setGroup(Group group) {
			this.group = group;
		}

		public GroupAdmin getGroupAdmin() {
			return groupAdmin;
		}

		public void setGroupAdmin(GroupAdmin groupAdmin) {
			this.groupAdmin = groupAdmin;
		}

		public GroupAdmin getGroupOwner() {
			return groupOwner;
		}

		public void setGroupOwner(GroupAdmin groupOwner) {
			this.groupOwner = groupOwner;
		}

		public long getJoinGroupMember() {
			return joinGroupMember;
		}

		public void setJoinGroupMember(long joinGroupMember) {
			this.joinGroupMember = joinGroupMember;
		}

	


}
