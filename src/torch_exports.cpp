#include <R_ext/Rdynload.h>
#include <Rcpp.h>
#include <torch_api.h>

#define REGISTER_C_CALLABLE(f) R_RegisterCCallable("torch", #f, (DL_FUNC)&f);

// [[Rcpp::init]]
void register_callables(DllInfo *dll) {
  REGISTER_C_CALLABLE(operator_sexp_tensor)
  REGISTER_C_CALLABLE(operator_sexp_optional_tensor)
  REGISTER_C_CALLABLE(operator_sexp_tensor_list)
  REGISTER_C_CALLABLE(operator_sexp_scalar)
  REGISTER_C_CALLABLE(operator_sexp_scalar_type)
  REGISTER_C_CALLABLE(operator_sexp_tensor_options)
  REGISTER_C_CALLABLE(operator_sexp_compilation_unit)
  REGISTER_C_CALLABLE(operator_sexp_device)
  REGISTER_C_CALLABLE(operator_sexp_script_module)
  REGISTER_C_CALLABLE(operator_sexp_script_method)
  REGISTER_C_CALLABLE(operator_sexp_dtype)
  REGISTER_C_CALLABLE(operator_sexp_dimname)
  REGISTER_C_CALLABLE(operator_sexp_dimname_list)
  REGISTER_C_CALLABLE(operator_sexp_generator)
  REGISTER_C_CALLABLE(operator_sexp_memory_format)
  REGISTER_C_CALLABLE(operator_sexp_vector_string)
  REGISTER_C_CALLABLE(operator_sexp_vector_scalar)
  REGISTER_C_CALLABLE(operator_sexp_string)
  REGISTER_C_CALLABLE(operator_string_string)
  REGISTER_C_CALLABLE(operator_sexp_jit_named_parameter_list)
  REGISTER_C_CALLABLE(operator_sexp_jit_named_buffer_list)
  REGISTER_C_CALLABLE(operator_sexp_jit_named_module_list)
  REGISTER_C_CALLABLE(operator_sexp_vector_bool)
  REGISTER_C_CALLABLE(operator_sexp_vector_int64_t)
  REGISTER_C_CALLABLE(operator_sexp_vector_double)
  REGISTER_C_CALLABLE(operator_sexp_stack)
  REGISTER_C_CALLABLE(operator_sexp_ivalue)
  REGISTER_C_CALLABLE(operator_sexp_tuple)
  REGISTER_C_CALLABLE(operator_sexp_named_tuple_helper)
  REGISTER_C_CALLABLE(operator_sexp_vector_ivalue)
  REGISTER_C_CALLABLE(operator_sexp_generic_dict)
  REGISTER_C_CALLABLE(operator_sexp_generic_list)
  REGISTER_C_CALLABLE(operator_sexp_optional_dimname_list)
  REGISTER_C_CALLABLE(operator_sexp_optional_generator)
  REGISTER_C_CALLABLE(operator_sexp_optional_double)
  REGISTER_C_CALLABLE(operator_sexp_optional_bool)
  REGISTER_C_CALLABLE(operator_sexp_optional_int64_t)
  REGISTER_C_CALLABLE(operator_sexp_bool)
  REGISTER_C_CALLABLE(operator_sexp_double)
  REGISTER_C_CALLABLE(operator_sexp_int64_t)
  REGISTER_C_CALLABLE(operator_sexp_optional_scalar)
  REGISTER_C_CALLABLE(operator_sexp_optional_string)
  REGISTER_C_CALLABLE(operator_sexp_optional_scalar_type)
  REGISTER_C_CALLABLE(operator_sexp_optional_memory_format)
  REGISTER_C_CALLABLE(operator_sexp_variable_list)

  REGISTER_C_CALLABLE(from_sexp_tensor)
  REGISTER_C_CALLABLE(from_sexp_optional_tensor)
  REGISTER_C_CALLABLE(from_sexp_index_tensor)
  REGISTER_C_CALLABLE(from_sexp_tensor_list)
  REGISTER_C_CALLABLE(from_sexp_scalar)
  REGISTER_C_CALLABLE(from_sexp_optional_tensor_list)
  REGISTER_C_CALLABLE(from_sexp_index_tensor_list)
  REGISTER_C_CALLABLE(from_sexp_optional_index_tensor_list)
  REGISTER_C_CALLABLE(from_sexp_tensor_options)
  REGISTER_C_CALLABLE(from_sexp_device)
  REGISTER_C_CALLABLE(from_sexp_optional_device)
  REGISTER_C_CALLABLE(from_sexp_script_module)
  REGISTER_C_CALLABLE(from_sexp_script_method)
  REGISTER_C_CALLABLE(from_sexp_dtype)
  REGISTER_C_CALLABLE(from_sexp_dimname)
  REGISTER_C_CALLABLE(from_sexp_dimname_list)
  REGISTER_C_CALLABLE(from_sexp_generator)
  REGISTER_C_CALLABLE(from_sexp_memory_format)
  REGISTER_C_CALLABLE(from_sexp_int_array_ref)
  REGISTER_C_CALLABLE(from_sexp_optional_int_array_ref)
  REGISTER_C_CALLABLE(from_sexp_string)
  REGISTER_C_CALLABLE(from_sexp_tuple)
  REGISTER_C_CALLABLE(from_sexp_tensor_dict)
  REGISTER_C_CALLABLE(from_sexp_ivalue)
  REGISTER_C_CALLABLE(from_sexp_function_schema)
  REGISTER_C_CALLABLE(from_sexp_function_schema_list)
  REGISTER_C_CALLABLE(from_sexp_function_schema_argument)
  REGISTER_C_CALLABLE(from_sexp_function_schema_argument_list)
  REGISTER_C_CALLABLE(from_sexp_vector_bool)
  REGISTER_C_CALLABLE(from_sexp_vector_scalar)
  REGISTER_C_CALLABLE(from_sexp_vector_int64_t)
  REGISTER_C_CALLABLE(from_sexp_vector_double)
  REGISTER_C_CALLABLE(from_sexp_named_tuple_helper)
  REGISTER_C_CALLABLE(from_sexp_stack)
  REGISTER_C_CALLABLE(from_sexp_compilation_unit)
  REGISTER_C_CALLABLE(from_sexp_index_int64_t)
  REGISTER_C_CALLABLE(from_sexp_optional_index_int64_t)
  REGISTER_C_CALLABLE(from_sexp_optional_bool)
  REGISTER_C_CALLABLE(from_sexp_bool)
  REGISTER_C_CALLABLE(from_sexp_optional_double_array_ref)
  REGISTER_C_CALLABLE(from_sexp_optional_dimname_list)
  REGISTER_C_CALLABLE(from_sexp_optional_generator)
  REGISTER_C_CALLABLE(from_sexp_optional_double)
  REGISTER_C_CALLABLE(from_sexp_double)
  REGISTER_C_CALLABLE(from_sexp_int64_t)
  REGISTER_C_CALLABLE(from_sexp_scalar_type)
  REGISTER_C_CALLABLE(from_sexp_optional_scalar)
  REGISTER_C_CALLABLE(from_sexp_optional_string)
  REGISTER_C_CALLABLE(from_sexp_optional_scalar_type)
  REGISTER_C_CALLABLE(from_sexp_optional_memory_format)
  REGISTER_C_CALLABLE(from_sexp_vector_string)
  REGISTER_C_CALLABLE(from_sexp_variable_list)
  REGISTER_C_CALLABLE(from_sexp_string_view)
  REGISTER_C_CALLABLE(from_sexp_optional_string_view)
  REGISTER_C_CALLABLE(from_sexp_sym_int_array_ref)
  REGISTER_C_CALLABLE(from_sexp_sym_int)

  REGISTER_C_CALLABLE(delete_tensor)
  REGISTER_C_CALLABLE(delete_script_module)
  REGISTER_C_CALLABLE(delete_script_method)
  REGISTER_C_CALLABLE(delete_optional_tensor)
  REGISTER_C_CALLABLE(delete_tensor_list)
  REGISTER_C_CALLABLE(delete_optional_tensor_list)
  REGISTER_C_CALLABLE(delete_scalar_type)
  REGISTER_C_CALLABLE(delete_scalar)
  REGISTER_C_CALLABLE(delete_tensor_options)
  REGISTER_C_CALLABLE(delete_device)
  REGISTER_C_CALLABLE(delete_optional_device)
  REGISTER_C_CALLABLE(delete_dtype)
  REGISTER_C_CALLABLE(delete_dimname)
  REGISTER_C_CALLABLE(delete_dimname_list)
  REGISTER_C_CALLABLE(delete_jit_named_parameter_list)
  REGISTER_C_CALLABLE(delete_jit_named_buffer_list)
  REGISTER_C_CALLABLE(delete_jit_named_module_list)
  REGISTER_C_CALLABLE(delete_generator)
  REGISTER_C_CALLABLE(delete_memory_format)
  REGISTER_C_CALLABLE(delete_vector_int64_t)
  REGISTER_C_CALLABLE(delete_function_ptr)
  REGISTER_C_CALLABLE(delete_optional_int_array_ref)
  REGISTER_C_CALLABLE(delete_vector_string)
  REGISTER_C_CALLABLE(delete_string)
  REGISTER_C_CALLABLE(delete_stack)
  REGISTER_C_CALLABLE(delete_ivalue)
  REGISTER_C_CALLABLE(delete_function_schema)
  REGISTER_C_CALLABLE(delete_function_schema_list)
  REGISTER_C_CALLABLE(delete_function_schema_argument)
  REGISTER_C_CALLABLE(delete_function_schema_argument_list)
  REGISTER_C_CALLABLE(delete_tuple)
  REGISTER_C_CALLABLE(delete_vector_bool)
  REGISTER_C_CALLABLE(delete_vector_scalar)
  REGISTER_C_CALLABLE(delete_vector_int64_t)
  REGISTER_C_CALLABLE(delete_vector_double)
  REGISTER_C_CALLABLE(delete_tensor_dict)
  REGISTER_C_CALLABLE(delete_generic_dict)
  REGISTER_C_CALLABLE(delete_generic_list)
  REGISTER_C_CALLABLE(delete_vector_ivalue)
  REGISTER_C_CALLABLE(delete_named_tuple_helper)
  REGISTER_C_CALLABLE(delete_compilation_unit)
  REGISTER_C_CALLABLE(delete_qscheme)
  REGISTER_C_CALLABLE(delete_double)
  REGISTER_C_CALLABLE(delete_variable_list)
  REGISTER_C_CALLABLE(delete_int64_t)
  REGISTER_C_CALLABLE(delete_bool)
  REGISTER_C_CALLABLE(delete_layout)
  REGISTER_C_CALLABLE(delete_tensor_index)
  REGISTER_C_CALLABLE(delete_optional_int64_t)
  REGISTER_C_CALLABLE(delete_slice)
  REGISTER_C_CALLABLE(delete_packed_sequence)
  REGISTER_C_CALLABLE(delete_storage)
  REGISTER_C_CALLABLE(delete_jit_module)
  REGISTER_C_CALLABLE(delete_traceable_function)
  REGISTER_C_CALLABLE(delete_vector_void)
  REGISTER_C_CALLABLE(delete_optional_bool)
  REGISTER_C_CALLABLE(delete_optional_double_array_ref)
  REGISTER_C_CALLABLE(delete_optional_dimname_list)
  REGISTER_C_CALLABLE(delete_optional_generator)
  REGISTER_C_CALLABLE(delete_optional_double)
  REGISTER_C_CALLABLE(delete_optional_string)
  REGISTER_C_CALLABLE(delete_optional_scalar)
  REGISTER_C_CALLABLE(delete_optional_scalar_type)
  REGISTER_C_CALLABLE(delete_optional_memory_format)
  REGISTER_C_CALLABLE(delete_string_view)
  REGISTER_C_CALLABLE(delete_optional_string_view)

  REGISTER_C_CALLABLE(fixme_new_string)
}
