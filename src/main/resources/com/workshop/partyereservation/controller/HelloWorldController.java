/**
 * 
 */
package com.workshop.partyereservation.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.workshop.partyereservation.utils.Constants;

@Controller
@RequestMapping("/")
public class HelloWorldController
{

   @RequestMapping(method = RequestMethod.GET)
   public String sayHello(ModelMap model)
   {
      model.addAttribute("greeting", "Hurry Up!! Send us your mobile number to be the first to reserve for our special party !!");
      return "welcome";
   }

   @RequestMapping(value = "/congrats", method = RequestMethod.GET)
   public String sayThankYou(@CookieValue(value = Constants.COOKIE_MOBILE, defaultValue = "") String partyCookieValue, ModelMap model,
      @RequestParam(value = "mobile", required = true) String mobile, HttpServletResponse response)
   {
      Cookie partyCookie = new Cookie(Constants.COOKIE_MOBILE, partyCookieValue);
      Cookie cookie = null;
      if(partyCookie == null || partyCookie.getName() == null || partyCookie.getName().length() == 0)
      {
         cookie = new Cookie(Constants.COOKIE_MOBILE, mobile);
      }
      else
      {
         String name = partyCookie.getName();
         String value = partyCookie.getValue();
         StringBuilder newCookieValue = new StringBuilder(value);
         if(value.length() > 0)
         {
            newCookieValue.append(',');
         }
         newCookieValue.append(mobile);
         if(isMobileAlreadyRegistered(value, mobile))
         {
            model.addAttribute("greeting", "You are already registered to the party. See ya :)");
         }
         else
         {
            cookie = new Cookie(name, newCookieValue.toString());
            response.addCookie(cookie);
            model.addAttribute("greeting", "Thank you for registering to our party. See u there ;)");
         }
      }
      return "thankyou";
   }

   /**
    * Method to check if the mobile already exists in the cookie or not
    * It returns true when the mobile number is already registered, otherwise it returns false
    * 
    * @param value
    * @param mobile
    */
   private boolean isMobileAlreadyRegistered(String value, String mobile)
   {
      List<String> mobilesList = Arrays.asList(value.split(","));
      for(int i = 0; i < mobilesList.size(); i++)
      {
         if(mobilesList.get(i).equals(mobile.trim()))
         {
            return true;
         }
      }
      return false;

   }

}