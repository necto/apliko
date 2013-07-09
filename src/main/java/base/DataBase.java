package base;

import base.entities.*;
import util.FilterGenerator;
import util.SortingGenerator;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.*;

public class DataBase {

    private static EntityManager getAuthEM()
    {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("authPU");
        return emf.createEntityManager();
    }

    private static EntityManager getClaimsEM()
    {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("persUnit");
        return emf.createEntityManager();
    }

    public static void deleteUser( String [] names)
    {
        EntityManager em = getAuthEM();
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
        EntityManager em = getAuthEM();
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
        EntityManager em = getClaimsEM();
        em.getTransaction().begin();
        ClaimsEntity clm = new ClaimsEntity();
        clm.setCreatorLogin(user);
        clm.setName(params.get("name")[0]);
        clm.setMiddleName(params.get("middle_name")[0]);
        clm.setSurname(params.get("surname")[0]);
        clm.setTelephone(params.get("telephone")[0]);
        clm.setBuilding( em.find(BuildingsEntity.class,
                                 Integer.parseInt(params.get("building")[0])));
        clm.setUnit( em.find(UnitsEntity.class,
                             Integer.parseInt(params.get("unit")[0])));
        clm.setRoom(params.get("room")[0]);
        clm.setDeviceType(params.get("device_type")[0]);
        clm.setDeviceNumber(params.get("device_number")[0]);
        clm.setProblemDescription(params.get("problem_description")[0]);
        clm.setPriority(em.find(PrioritiesEntity.class,
                                Integer.parseInt(params.get("priority")[0])));
        clm.setComment(params.get("comment")[0]);
        clm.setServiceNumber(params.get("service_number")[0]);
        clm.setDate(new Date());
        clm.setStatus(em.find(StatusesEntity.class, 1));
        em.persist( clm);
        em.getTransaction().commit();
    }

    public static ClaimsEntity generateClaimByUser( String userName)
    {
        EntityManager em = getAuthEM();
        UsersEntity user = em.find(UsersEntity.class, userName);

        ClaimsEntity ret = new ClaimsEntity();
        ret.setName(user.getName());
        ret.setMiddleName(user.getMiddleName());
        ret.setSurname(user.getSurname());
        ret.setTelephone(user.getTelephone());

        /* TODO: other fields: unit, building, room, ... */

        return ret;
    }

    private static List<UsersEntity> keepOnlyRelevantUsers( List<UsersEntity> users)
    {
        List<UsersEntity> ret = new ArrayList<UsersEntity>(users.size());
        for ( UsersEntity user : users)
            if ( user.getRoles().contains("manager") ||
                 user.getRoles().contains("customer") ||
                 user.getRoles().contains("performer") )
                ret.add(user);
        return ret;
    }

    public static List<UsersEntity> listUsers(Map<String, String[]> params)
    {
        EntityManager em = getAuthEM();
        List<UsersEntity> ret =  em.createQuery("select u from UsersEntity u " +
                new FilterGenerator(params).variable("u").generate() +
                new SortingGenerator(params).variable("u").generate()).getResultList();
        return keepOnlyRelevantUsers(ret);
    }

    public static List<ClaimsEntity> listClaims(Map<String, String[]> params)
    {
        EntityManager em = getClaimsEM();
        return em.createQuery("select m from ClaimsEntity m " +
                               new FilterGenerator(params).variable("m").generate() +
                               new SortingGenerator(params).variable("m").generate()).getResultList();
    }

    public static ClaimsEntity getClaim( Integer id)
    {
        EntityManager em = getClaimsEM();
        return em.find(ClaimsEntity.class, id);
    }

    public static UsersEntity getUser( String userName)
    {
        EntityManager em = getAuthEM();
        UsersEntity user = em.find(UsersEntity.class, userName);
        return user;
    }

    public static List<TownsEntity> listTowns()
    {
        EntityManager em = getClaimsEM();
        return em.createQuery("select t from TownsEntity t").getResultList();
    }

    public static void addTown( String name)
    {
        EntityManager em = getClaimsEM();

        em.getTransaction().begin();
        TownsEntity town = new TownsEntity();
        town.setName(name);
        em.persist(town);
        em.getTransaction().commit();
    }

    public static void deleteTown( Integer id)
    {
        EntityManager em = getClaimsEM();

        em.getTransaction().begin();
        TownsEntity town = em.find(TownsEntity.class, id);
        for (BuildingsEntity building: town.getBuildings())
        {
            for (ClaimsEntity claim: building.getClaims())
                em.remove(claim);
            em.remove(building);
        }
        em.remove(town);
        em.getTransaction().commit();
    }

    public static void addBuildings( String[] names, String town_name)
    {
        EntityManager em = getClaimsEM();

        em.getTransaction().begin();
        TownsEntity town = (TownsEntity)em.createQuery("select t from TownsEntity t where t.name = '" +
                                    town_name + "'").getSingleResult();
        for ( String name : names)
        {
            BuildingsEntity building = new BuildingsEntity();
            building.setName(name);
            em.persist(building);
            town.getBuildings().add(building);
        }
        em.persist(town);
        em.getTransaction().commit();
    }

    public static void deleteBuilding( Integer id)
    {
        EntityManager em = getClaimsEM();

        em.getTransaction().begin();
        BuildingsEntity building = em.find(BuildingsEntity.class, id);
        for ( ClaimsEntity claim : building.getClaims())
            em.remove(claim);
        em.remove(building);
        em.getTransaction().commit();
    }

    public static void addUnit( String name)
    {
        EntityManager em = getClaimsEM();

        em.getTransaction().begin();
        UnitsEntity unit = new UnitsEntity();
        unit.setName(name);
        em.persist(unit);
        em.getTransaction().commit();
    }

    public static void deleteUnit( Integer id)
    {
        EntityManager em = getClaimsEM();

        em.getTransaction().begin();
        UnitsEntity unit = em.find(UnitsEntity.class, id);
        for (ClaimsEntity claim : unit.getClaims())
            em.remove(claim);
        em.remove(unit);
        em.getTransaction().commit();
    }

    public static List<UnitsEntity> listUnits()
    {
        EntityManager em = getClaimsEM();
        return em.createQuery("select u from UnitsEntity u").getResultList();
    }

    public static List<PrioritiesEntity> listPriorities()
    {
        EntityManager em = getClaimsEM();
        return em.createQuery("select p from PrioritiesEntity p").getResultList();
    }
}
