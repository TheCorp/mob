package com.mob.dao.hibernate;

import java.util.List;
import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.mob.dao.GroupMobDao;
import com.mob.model.FlagData;
import com.mob.model.Role;
import com.mob.model.User;
import com.mob.model.group.Group;
import com.mob.model.group.GroupAdmin;
import com.mob.model.group.GroupDiscussions;
import com.mob.model.group.GroupJoinUsers;
import com.mob.model.group.GroupJoinUsers;
import com.mob.model.group.Topics;
import com.mob.model.profile.Profile;

public class GroupHibernateDao extends HibernateDaoSupport implements
GroupMobDao {



	public List<Group> findGroupsAsCreator(User user){
		
		String queryString = "from Group g where g.profile.profileOwner.id =:profileOwnerId";
		Query query = getSession().createQuery(queryString);
		query.setLong("profileOwnerId", user.getId());
		List<Group> result = query.list();
		return result;
	}
	
	
	public List<Group> findGroupsAsMember(User user){
		
		String queryString = "select distinct (g) from Group g join fetch g.groupUsersProfiles gp where gp.profileOwner.id=:profileOwnerId";
		Query query = getSession().createQuery(queryString);
		query.setLong("profileOwnerId", user.getId());
		List<Group> result = query.list();
		return result;
	}
	
	public GroupJoinUsers findProfile(GroupJoinUsers groupJoinusers, long id) {
		// TODO Auto-generated method stub
		GroupJoinUsers groupJoinUsers = new GroupJoinUsers();
		String hql = "from GroupJoinUsers g where g.profile.id=:id";
		List<GroupJoinUsers> groupJoinUsersList = getHibernateTemplate()
		.findByNamedParam(hql, "id", id);
		
		if (groupJoinUsersList.size() != 0) {
			groupJoinUsers = groupJoinUsersList.get(0);
		}
		return groupJoinUsers;
	}

	

	public void updateGroupUsers(long  profileId) {
		// TODO Auto-generated method stub
		String hql = "update GroupJoinUsers set groupType=:groupType where profileid = :profileId";
		Query query = getSession().createQuery(hql);
		query.setBoolean("groupType", true);
		query.setLong("profileId", profileId);
		query.executeUpdate();

	}


	public List<Topics> findAllGroupTopics(long groupid) {
		
		String queryString = "from Topics t where t.group.id =:groupid order by  t.createdDate desc";
		Query query = getSession().createQuery(queryString);
		query.setLong("groupid", groupid);
		List<Topics> result = query.list();
		return result;
	}

	
	public Topics findAllGroupTopicInfo(long id) {
		String queryString = "from Topics t where t.id =:id";
		Query query = getSession().createQuery(queryString);
		query.setLong("id",id);
		Topics topics=(Topics)query.uniqueResult();
		return topics;
	}
	
	public List<GroupJoinUsers> findAllGroupProfiles(long groupid) {
		String queryString = "from GroupJoinUsers g where g.group.id =:groupid";
		Query query = getSession().createQuery(queryString);
		query.setLong("groupid", groupid);
		List<GroupJoinUsers> result = query.list();
		return result;
	}


	public List<Profile> findAllGroupUsers(long profileId) {
		String queryString = "from Profile p where p.id =:profileId";
		Query query = getSession().createQuery(queryString);
		query.setLong("profileId", profileId);
		List<Profile> result = query.list();
		return result;
	}
	
	

	
	public List<GroupDiscussions> findAllGroupDiscussions(long topicId) {
		String queryString = "from GroupDiscussions g where g.topics.id =:topicId  order by  g.createdDate desc";
		Query query = getSession().createQuery(queryString);
		query.setLong("topicId", topicId);
		List<GroupDiscussions> result = query.list();
		return result;
	}


	
	public Role findGroupAdminRole(String groupRoleName) {
		// TODO Auto-generated method stub
		Role role= new Role();
		String queryString = "from Role r where r.name =:groupRoleName";
		List<Role> roleList = getHibernateTemplate()
		.findByNamedParam(queryString, "groupRoleName", groupRoleName);
		System.out.println("roleList" +roleList.size());
		if (roleList.size() != 0) {
			role = roleList.get(0);
		}
		return role;
	}



	public boolean findGroupRoleAdmin(long groupId, long profileId) {
		// TODO Auto-generated method stub
		boolean isAdmin=false;
		GroupAdmin  groupAdmin= new GroupAdmin();
		String queryString = "from GroupAdmin  g where g.profile.id =:profileId and g.group.id =:groupId";
		List<Long> groupMembersList = (List<Long>) getHibernateTemplate().
		findByNamedParam(queryString, new String[]{"profileId", "groupId"}, new Object[]{profileId, groupId});
		System.out.println("roleList" +groupMembersList.size());
		if (groupMembersList.size() != 0) {
			isAdmin=true;
		}else{
			isAdmin=false;
		}
		return isAdmin;

	}
	
	public GroupAdmin findGroupAdminRole(long groupId, long profileId) {
		// TODO Auto-generated method stub
		GroupAdmin  groupAdmin= new GroupAdmin();
		String queryString = "from GroupAdmin  g where g.profile.id =:profileId and g.group.id =:groupId";
		List<GroupAdmin> groupMembersList = (List<GroupAdmin>) getHibernateTemplate().
		findByNamedParam(queryString, new String[]{"profileId", "groupId"}, new Object[]{profileId, groupId});
		System.out.println("roleList" +groupMembersList.size());
		if (groupMembersList.size() != 0) {
			groupAdmin=groupMembersList.get(0);
		}
		return groupAdmin;

	}


	public List<Group> findPrivateGroupsAsMember(User user) {
		// TODO Auto-generated method stub
		String queryString = "select distinct (g) from Group g join fetch g.groupInvitationProfiles gv where gv.profileOwner.id=:profileOwnerId";
		Query query = getSession().createQuery(queryString);
		query.setLong("profileOwnerId", user.getId());
		List<Group> result = query.list();
		return result;
	}


	
	public GroupAdmin findProfileGroupRole(long groupId, long userId) {
	
		GroupAdmin  groupAdmin= new GroupAdmin();
		String queryString = "from GroupAdmin g where g.group.id =:groupId and g.profile.profileOwner.id =:userId";
		List<GroupAdmin> groupMembersList = (List<GroupAdmin>) getHibernateTemplate().
		findByNamedParam(queryString, new String[]{"groupId", "userId"}, new Object[]{groupId, userId});
		System.out.println("roleList" +groupMembersList.size());
		if (groupMembersList.size() != 0) {
			groupAdmin=groupMembersList.get(0);
		}
		return groupAdmin;
		
		
	}



	public List<Group> findGroupOwnerProfile(long groupId) {
		String queryString = "from Group g where g.id =:groupId";
		Query query = getSession().createQuery(queryString);
		query.setLong("groupId", groupId);
		List<Group> result = query.list();
		return result;
	}


	public GroupAdmin findProfileGroupOwnerRole(long groupId, long profileId) {
		GroupAdmin  groupAdmin= new GroupAdmin();
		String queryString = "from GroupAdmin g where g.group.id =:groupId and g.profile.id =:profileId";
		List<GroupAdmin> groupMembersList = (List<GroupAdmin>) getHibernateTemplate().
		findByNamedParam(queryString, new String[]{"groupId", "profileId"}, new Object[]{groupId, profileId});
		System.out.println("roleList" +groupMembersList.size());
		if (groupMembersList.size() != 0) {
			groupAdmin=groupMembersList.get(0);
		}
		return groupAdmin;
		
		
	}
	
	public long findNewTopicsId(long id) {
		long newTopicsId = 0;
		Topics topics = new Topics();
		String queryString = "from Topics t where t.group.id =:id  and t.id=(select max(t1.id) from Topics t1))";
		List<Topics> topicsList = getHibernateTemplate().findByNamedParam(
				queryString, "id", id);
		if (topicsList.size() != 0) {
			topics = (Topics) topicsList.get(0);
			newTopicsId = topics.getId();
			System.out.println("New newTopicsId Id:--" + newTopicsId);
		}
		return newTopicsId;
	}


	

}
