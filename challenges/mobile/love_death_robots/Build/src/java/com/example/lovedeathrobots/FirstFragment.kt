package com.example.lovedeathrobots

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.navigation.fragment.findNavController
import com.example.lovedeathrobots.databinding.FragmentFirstBinding

/**
 * A simple [Fragment] subclass as the default destination in the navigation.
 */
class FirstFragment : Fragment() {

    private var _binding: FragmentFirstBinding? = null

    // This property is only valid between onCreateView and
    // onDestroyView.
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {

        _binding = FragmentFirstBinding.inflate(inflater, container, false)
        return binding.root

    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        binding.buttonFirst.setOnClickListener {
            val k = Kripteau()
            if(binding.textPassword.text.toString().length > 4){
                var c = k.crypter(binding.textPassword.text.toString(), "[BreizhCTF_2023]")
                if (c == "E+ag9V2E9ONjwkJRyMksO40fc/KdqPPjbVIhpfWh1pfy8jg7Bv/TFvK9s+3j3HWrys21jW8Y45w="){
                    binding.textOutput.setText(binding.textPassword.text)
                }
                else{
                    binding.textOutput.setText("Mauvais mot de passe :c")
                }
            }
            else{
                binding.textOutput.setText("Mauvais mot de passe :c")
            }
        }
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}