using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HasanRestaurantWebApp.Models;
using HasanRestaurantWebApp.Repositories;
using HasanRestaurantWebApp.ViewModels;

namespace HasanRestaurantWebApp.Controllers
{
    public class HomeController : Controller
    {
        private readonly RestaurantDBEntities1 restaurantDBEntities;
        public HomeController()
        {
            restaurantDBEntities = new RestaurantDBEntities1 ();
        }
        // GET: Home
        public ActionResult Index()
        {
            var objCustomerRepository = new CustomerRepository();
            var objItemRepository = new ItemRepository();
            var objPaymentRepository = new PaymentTypeRepository();
            var objMultipleModels = new Tuple<IEnumerable<SelectListItem>, IEnumerable<SelectListItem>, IEnumerable<SelectListItem>>(
                    objCustomerRepository.GetAllCustomers(), objItemRepository.GetAllItems(), objPaymentRepository.GetAllPaymentType());

            return View(objMultipleModels);
        }
        [HttpGet]

        public JsonResult getItemUnitPrice(int itemId)
        {
            decimal UnitPrice = restaurantDBEntities.Items.Single(model => model.ItemId == itemId).ItemPrice;
            return Json(UnitPrice, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult Index(OrderViewModel objOrderViewModel)
        {
            OrderRepository objOrderRepository = new OrderRepository();
            bool isStatus = objOrderRepository.AddOrder(objOrderViewModel);
            string SuccessMessage = String.Empty;

            if (isStatus)
            {
                SuccessMessage = "Your Order Has Been Successfully Placed.";
            }
            else
            {
                SuccessMessage = "There Is Some Issue While Placing Order.";
            }
            return Json(SuccessMessage, JsonRequestBehavior.AllowGet);
        }
 

public ActionResult About()
        {
            ViewBag.Message = "HASAN RESTURENT HOUSE";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Md. Ibrahim Hasan";

            return View();
        }
    }
}