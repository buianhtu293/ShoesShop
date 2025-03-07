<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="scroll-smooth group" data-sidebar="brand" dir="ltr">
    <head>
        <meta charset="utf-8" />
        <title>Robotech - Admin & Dashboard Template</title>
        <meta  name="viewport"  content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta  content="Tailwind Multipurpose Admin & Dashboard Template"  name="description"/>
        <meta content="" name="Mannatthemes" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="viewsAdmin/assets/images/favicon.ico" />

        <!-- Css -->
        <!-- Main Css -->
        <link rel="stylesheet" href="viewsAdmin/assets/libs/icofont/icofont.min.css">
        <link href="viewsAdmin/assets/libs/flatpickr/flatpickr.min.css" type="text/css" rel="stylesheet">
        <link rel="stylesheet" href="viewsAdmin/assets/css/tailwind.min.css">

    </head>

    <body data-layout-mode="light"  data-sidebar-size="default" data-theme-layout="vertical" class="bg-[#EEF0FC] dark:bg-gray-900">

        <jsp:include page="components/leftBar.jsp" />

        <jsp:include page="components/topBar.jsp" />


        <div class="ltr:flex flex-1 rtl:flex-row-reverse">
            <div class="page-wrapper relative ltr:ms-auto rtl:me-auto rtl:ms-0 w-[calc(100%-260px)] px-4 pt-[64px] duration-300">
                <div class="xl:w-full">        
                    <div class="flex flex-wrap">
                        <div class="flex items-center py-4 w-full">
                            <div class="w-full">                    
                                <div class="">
                                    <div class="flex flex-wrap justify-between">
                                        <div class="items-center ">
                                            <h1 class="font-medium text-3xl block dark:text-slate-100">Customers</h1>
                                            <ol class="list-reset flex text-sm">
                                                <li><a href="#" class="text-gray-500 dark:text-slate-400">Robotech</a></li>
                                                <li><span class="text-gray-500 dark:text-slate-400 mx-2">/</span></li>
                                                <li class="text-gray-500 dark:text-slate-400">Admin</li>
                                                <li><span class="text-gray-500 dark:text-slate-400 mx-2">/</span></li>
                                                <li class="text-primary-500 hover:text-primary-600 dark:text-primary-400">Details</li>
                                            </ol>
                                        </div>
                                        <div class="flex items-center">
                                            <div class="today-date leading-5 mt-2 lg:mt-0 form-input w-auto rounded-md border inline-block border-primary-500/60 dark:border-primary-500/60 text-primary-500 bg-transparent px-3 py-1 focus:outline-none focus:ring-0 placeholder:text-slate-400/70 placeholder:font-normal placeholder:text-sm hover:border-primary-400 focus:border-primary-500 dark:focus:border-primary-500  dark:hover:border-slate-700">
                                                <input type="text" class="dash_date border-0 focus:border-0 focus:outline-none" readonly  required="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!--end container-->

                <div class="xl:w-full  min-h-[calc(100vh-138px)] relative pb-14"> 
                    <div class="grid grid-cols-12 sm:grid-cols-12 md:grid-cols-12 lg:grid-cols-12 xl:grid-cols-12 gap-4">
                        <div class="col-span-12 sm:col-span-12 md:col-span-12 lg:col-span-8 xl:col-span-9">
                            <div class="w-full relative mb-4">  
                                <div class="flex-auto p-0 md:p-4">
                                    <div class="mb-4 border-b border-gray-200 dark:border-slate-700" data-fc-type="tab">
                                        <ul class="flex flex-wrap -mb-px text-sm font-medium text-center" aria-label="Tabs">
                                            <li class="me-2" role="presentation">
                                                <button class="inline-block p-4 rounded-t-lg border-b-2 border-transparent hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300" id="wishlist-tab" data-fc-target="#wishlist" type="button" role="tab" aria-controls="wishlist" aria-selected="false">History <span class="text-slate-400">(${userHistories.size()})</span></button>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="px-4 py-5 sm:px-6">
                                        <h3 class="text-lg leading-6 font-medium text-gray-900">Slider Details</h3>
                                        <p class="mt-1 max-w-2xl text-sm text-gray-500">Personal details and application.</p>
                                    </div>
                                    <div class="border-t border-gray-200">
                                        <dl>
                                            <div class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                                <dt class="text-sm font-medium text-gray-500">Title</dt>
                                                <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">${slider.title}</dd>
                                            </div>
                                            <div class="bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                                <dt class="text-sm font-medium text-gray-500">Image</dt>
                                                <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                                                    <img src="${slider.image}" alt="Slider Image" class="w-full max-w-xs">
                                                </dd>
                                            </div>
                                            <div class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                                <dt class="text-sm font-medium text-gray-500">BackLink</dt>
                                                <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">${slider.backLink}</dd>
                                            </div>
                                            <div class="bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                                <dt class="text-sm font-medium text-gray-500">Status</dt>
                                                <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">${slider.status}</dd>
                                            </div>
                                        </dl>
                                    </div>
                                </div><!--end card-body--> 
                            </div><!--end card-->                                  
                        </div><!--end col-->                        
                    </div> <!--end grid-->                                        
                    <!-- footer -->
                    <div class="absolute bottom-0 -left-4 -right-4 block print:hidden border-t p-4 h-[52px] dark:border-slate-700/40">
                        <div class="container">
                            <!-- Footer Start -->
                            <footer
                                class="footer bg-transparent  text-center  font-medium text-slate-600 dark:text-slate-400 md:text-left "
                                >
                                &copy;
                                <script>
                                    var year = new Date();
                                    document.write(year.getFullYear());
                                </script>
                                Robotech
                                <span class="float-right hidden text-slate-600 dark:text-slate-400 md:inline-block"
                                      >Crafted with <i class="ti ti-heart text-red-500"></i> by
                                    Mannatthemes</span
                                >
                            </footer>
                            <!-- end Footer -->
                        </div>
                    </div>


                </div><!--end container-->
            </div><!--end page-wrapper-->
        </div><!--end /div-->

        <!-- JAVASCRIPTS -->
        <!-- <div class="menu-overlay"></div> -->
        <script src="viewsAdmin/assets/libs/lucide/umd/lucide.min.js"></script>
        <script src="viewsAdmin/assets/libs/simplebar/simplebar.min.js"></script>
        <script src="viewsAdmin/assets/libs/flatpickr/flatpickr.min.js"></script>
        <script src="viewsAdmin/assets/libs/@frostui/tailwindcss/frostui.js"></script>

        <script src="viewsAdmin/assets/libs/apexcharts/apexcharts.min.js"></script>
        <script src="viewsAdmin/assets/js/pages/analytics-index.init.js"></script>
        <script src="viewsAdmin/assets/js/app.js"></script>
        <!-- JAVASCRIPTS -->
    </body>
</html>