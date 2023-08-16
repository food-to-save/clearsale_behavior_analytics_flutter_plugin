package com.foodtosave.clearsale_behavior_analytics.clear_sale_behavior_analytics

import android.content.Context
import sale.clear.behavior.android.Behavior

class ClearSaleManager(private val context: Context) {

    private lateinit var behavior: Behavior

    fun blockGeolocation() {
        behavior.blockLocation()
    }

    fun blockAppList() {
        behavior.blockAppsList()
    }

    fun start(appId: String) {
        behavior = Behavior.getInstance(context, appId)
        behavior.start()
        val sessionId = behavior.generateSessionID()
        behavior.collectDeviceInformation(sessionId)
    }

    fun stop() {
        behavior.stop()
    }
}