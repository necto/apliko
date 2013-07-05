package base;

import base.entities.ClaimsEntity;
import base.entities.UsersEntity;
import util.FilterGenerator;
import util.SortingGenerator;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class DataBase {
    public static void deleteUser( String [] names)
    {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("authPU");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        for ( String name : names)
        {
            UsersEntity user = em.find(UsersEntity.class, name);
            em.remove(user);
        }
        em.getTransaction().commit();
    }
    public static void addUser( Map<String,String[]> parameters)
    {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("authPU");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        UsersEntity user = new UsersEntity();
        user.setUserName(parameters.get("user_name")[0]);
        user.setUserPass(parameters.get("user_pass")[0]);

        List<String> roles = new ArrayList<String>();
        roles.add(parameters.get("user-role")[0]);

        user.setRoles(roles);
        user.setName(parameters.get("name")[0]);
        user.setSurname(parameters.get("surname")[0]);
        user.setMiddleName("middle_name");
        user.setBuilding("buildings_list");
        user.setUnit("unit");
        user.setTelephone("telephone");

        
        em.persist(user);
        em.getTransaction().commit();
    }

    public static void addClaim( Map<String, String[]> params, String user)
    {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("persUnit");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        ClaimsEntity clm = new ClaimsEntity();
        clm.setName(params.get("name")[0]);
        clm.setTelephone(params.get("telephone")[0]);
        clm.setBuildings_list(params.get("buildings_list")[0]);
        clm.setRoom(params.get("room")[0]);
        clm.setDevice_type(params.get("device_type")[0]);
        clm.setDevice_number(params.get("device_number")[0]);
        clm.setProblem_description(params.get("problem_description")[0]);
        clm.setPriority(params.get("priority")[0]);
        clm.setComment(params.get("comment")[0]);
        clm.setDate(new Date());
        clm.setStatus("No status !!!");
        clm.setUserName(user);
        em.persist( clm);
        em.getTransaction().commit();
    }

    public static List<UsersEntity> listUsers(Map<String, String[]> params)
    {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("authPU");
        EntityManager em = emf.createEntityManager();
        return em.createQuery("select u from UsersEntity u " +
                new FilterGenerator(params).variable("u").generate() +
                new SortingGenerator(params).variable("u").generate()).getResultList();
    }

    public static List<ClaimsEntity> listClaims(Map<String, String[]> params)
    {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("persUnit");
        EntityManager em = emf.createEntityManager();
        return em.createQuery("select m from ClaimsEntity m " +
                               new FilterGenerator(params).variable("m").generate() +
                               new SortingGenerator(params).variable("m").generate()).getResultList();
    }

    public static ClaimsEntity getClaim( Integer id)
    {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("persUnit");
        EntityManager em = emf.createEntityManager();
        return em.find(ClaimsEntity.class, id);
    }
}
