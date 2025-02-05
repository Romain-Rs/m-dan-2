/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package com.orange.ease.dan.ui

import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.view.View
import com.orange.ease.dan.databinding.ActivityAxsorangeBinding
import com.orange.ease.dan.navigation.DialogActivity

class AxsOrangeActivity : DialogActivity() {

    private lateinit var binding: ActivityAxsorangeBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityAxsorangeBinding.inflate(layoutInflater)
        val view = binding.root
        setupToolbar()
        setContentView(view)
    }

    private fun setupToolbar() {
        setSupportActionBar(binding.myToolbar)
        val actionBar = supportActionBar
        actionBar?.setDisplayHomeAsUpEnabled(true)
        binding.myToolbar.setNavigationOnClickListener { _ -> onBackPressed() }
    }

    fun clickNetwork(view: View) {
        val packageName = "com.orange.wifiorange"
        startPackageActivity(packageName)
    }

    fun clickFootball(view: View) {
        val packageName = "com.orange.ofc"
        startPackageActivity(packageName)
    }

    fun clickLivebox(view: View) {
        val packageName = "com.orange.mylivebox.fr"
        startPackageActivity(packageName)
    }

    fun clickOEM(view: View) {
        val packageName = "com.orange.orangeetmoi"
        startPackageActivity(packageName)
    }

    private fun startPackageActivity(packageName: String) {
        val startActivitySettings: () -> Unit = {
            startNewActivity(this, packageName)
        }
        initAlertDialogStartActivity(startActivitySettings)
    }

    private fun startNewActivity(context: Context, packageName: String) {
        var intent = context.packageManager.getLaunchIntentForPackage(packageName)
        if (intent == null) {
            intent = Intent(Intent.ACTION_VIEW)
            intent.data = Uri.parse("market://details?id=$packageName")
        }
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        context.startActivity(intent)
    }
}


